package pl.coderslab.charity.homePage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.donation.DonationService;
import pl.coderslab.charity.institution.Institution;
import pl.coderslab.charity.institution.InstitutionService;

import java.util.List;

@Controller
@RequestMapping("/")
public class HomePageController {

    private final InstitutionService institutionService;

    private final DonationService donationService;


    @Autowired
    public HomePageController(InstitutionService institutionService, DonationService donationService) {
        this.institutionService = institutionService;
        this.donationService = donationService;
    }

    @GetMapping()
    public String home(Model model) {
        List<Institution> institutions = institutionService.findAll();
        model.addAttribute("institutions", institutions);
        model.addAttribute("bags", donationService.allBags());
        model.addAttribute("supports", donationService.supportedInstitutions());
        return "index";
    }


}
