package pl.coderslab.charity.donation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DonationRepository extends JpaRepository<Donation, Long> {

    @Query("SELECT SUM(quantity) FROM donation")
    Long bagsSummary();

    @Query("SELECT COUNT (DISTINCT institution_id) FROM donation")
    Long supportedInstitutions();


}
