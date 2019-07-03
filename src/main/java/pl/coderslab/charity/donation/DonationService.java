package pl.coderslab.charity.donation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DonationService {

    private final DonationRepository donationRepository;

    @Autowired
    public DonationService(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
    }

    public void create(Donation donation) {
        donationRepository.save(donation);
    }

    public Donation read(Long id) {
        return donationRepository.findById(id).orElse(null);
    }

    public void update(Donation donation) {
        donationRepository.save(donation);
    }

    public void delete(Long id) {
        donationRepository.deleteById(id);
    }

    public List<Donation> findAll() {
        return donationRepository.findAll();
    }


}
