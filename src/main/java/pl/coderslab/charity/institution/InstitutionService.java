package pl.coderslab.charity.institution;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class InstitutionService {

    private final InstitutionRepository institutionRepository;

    @Autowired
    public InstitutionService(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    public void create(Institution institution) {
        institutionRepository.save(institution);
    }

    public Institution read(Long id) {
        return institutionRepository.findById(id).orElse(null);
    }

    public void update(Institution institution) {
        institutionRepository.save(institution);
    }

    public void delete(Long id) {
        institutionRepository.deleteById(id);
    }

    public List<Institution> findAll() {
        return institutionRepository.findAll();
    }
}
