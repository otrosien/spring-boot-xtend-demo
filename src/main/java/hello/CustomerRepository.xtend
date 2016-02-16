package hello

import org.springframework.data.repository.CrudRepository
import java.util.UUID
import org.springframework.data.rest.core.annotation.RepositoryRestResource

@RepositoryRestResource
interface CustomerRepository extends CrudRepository<Customer, UUID> {
    def Iterable<Customer> findByLastName(String lastName)
}