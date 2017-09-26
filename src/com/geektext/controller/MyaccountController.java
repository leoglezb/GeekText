package com.geektext.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderAddressComponent;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.LatLng;
import com.geektext.form.City;
import com.geektext.form.Country;
import com.geektext.form.State;
import com.geektext.form.Userdetails;
import com.geektext.pojo.Location;
import com.geektext.service.CityService;
import com.geektext.service.CountryService;
import com.geektext.service.StateService;
import com.geektext.service.UserdetailsService;
import com.geektext.service.imp.BeanSpring;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MyaccountController {
	@Autowired
	private UserdetailsService serviceuser;
	@Autowired
	private CountryService servicecountry;
	@Autowired
	private CityService servicecity;
	@Autowired
	private StateService servicestate;

	@Autowired
	private BeanSpring beanSpring;
	
	private static final Logger logger = LoggerFactory.getLogger(EventsController.class);
	
	@RequestMapping(value = "/myaccount", method = RequestMethod.GET)
	public String myaccount(Model model, Locale locale, HttpServletRequest request)throws Exception {
        final String userIpAddress = request.getRemoteAddr();
        final String userAgent = request.getHeader("user-agent");
		final String userHost = request.getRemoteHost();
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		if (userdetails.getLatitude()==null || userdetails.getLongitude()==null || userdetails.getLatitude().equals("") || userdetails.getLongitude().equals("")){
			String urlStr=null;
			if (userIpAddress.equals("127.0.0.1")){
				urlStr="http://freegeoip.net/xml/98.203.51.54";
			} else{
				urlStr="http://freegeoip.net/xml/"+userIpAddress;
			}
			Location location = new Location(urlStr);
			userdetails.setLongitude(location.getLongitude());
			userdetails.setLatitude(location.getLatitude());
		}
		model.addAttribute("userdetails", userdetails);
		model.addAttribute("currentTimestamp", new Timestamp(java.lang.System.currentTimeMillis()));
		return "myaccount";
	}
	
	@RequestMapping(value = "/updateMyaccount", method = RequestMethod.POST)
	public String addMyaccount(@ModelAttribute("command") Userdetails bean, BindingResult result, MultipartHttpServletRequest request) throws Exception {
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		final Geocoder geocoder = new Geocoder();
		LatLng location = new LatLng(bean.getLatitude(),bean.getLongitude());
		GeocoderRequest geocoderRequest = new GeocoderRequestBuilder().setLocation(location).setLanguage("en").getGeocoderRequest();
		GeocodeResponse geocoderResponse = geocoder.geocode(geocoderRequest);
		List<GeocoderAddressComponent> addressComponents =geocoderResponse.getResults().get(0).getAddressComponents();
		String id_country = addressComponents.get(6).getShortName();
		if(!servicecountry.exist(id_country)){
			Country country = new Country();
			country.setId(id_country);
			String desc_country = addressComponents.get(6).getLongName();
			country.setDescrip(desc_country);
			servicecountry.addCountry(country);
		}
		String id_state = addressComponents.get(5).getShortName();
		if(!servicestate.exist(id_state)){
			State state = new State();
			state.setId(id_country);
			String desc_state = addressComponents.get(5).getLongName();
			state.setDescrip(desc_state);
			servicestate.addState(state);
		}
		String id_city = addressComponents.get(3).getShortName();
		String desc_city = addressComponents.get(3).getLongName();
		City city = new City();
		city.setId(id_city);
		city.setId_state(id_state);
		city.setDescrip(desc_city);
		if(!servicecity.exist(city)){
			servicecity.addCity(city);
		}
		String county = addressComponents.get(4).getShortName();
		userdetails.setCounty(county);
		userdetails.setId_state(id_state);
		userdetails.setCountry(id_country);
		userdetails.setId_city(id_city);
		String zipcode = addressComponents.get(7).getShortName();
		userdetails.setZipcode(zipcode);
		userdetails.setName(bean.getName());
		userdetails.setLastname(bean.getLastname());
		userdetails.setEmail(bean.getEmail());
		userdetails.setOcupation(bean.getOcupation());
		userdetails.setPhone(bean.getPhone());
		userdetails.setFax(bean.getFax());
		userdetails.setHome_adress(bean.getHome_adress());
		userdetails.setDescrip(bean.getDescrip());
		userdetails.setLatitude(bean.getLatitude());
		userdetails.setLongitude(bean.getLongitude());
		userdetails.setActivationcode("1");
		userdetails.setDe("P");
		userdetails.setDate_add(new Timestamp(java.lang.System.currentTimeMillis()));
		serviceuser.updateUserdetails(userdetails);
		return "redirect:/myaccount";
	}
	
	private String loggedInUserName() {
		String result=null;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth instanceof AnonymousAuthenticationToken) {
			result = "ZooWaaUserNotLoggedIn";
		} else {
			result = auth.getName();
		}
		return result;
	}
}
