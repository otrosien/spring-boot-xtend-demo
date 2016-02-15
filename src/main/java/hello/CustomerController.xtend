package hello

import java.util.UUID
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class CustomerController {

    @Autowired
    CustomerRepository repository

    @RequestMapping("/")
    def findAll() {
        repository.findAll
    }

    @RequestMapping("/find/byLastName/{lastName}")
    def findByLastName(@PathVariable String lastName) {
        repository.findByLastName(lastName)
    }

    @RequestMapping("/{uuid}")
    def findOne(@PathVariable UUID uuid) {
        repository.findOne(uuid)
    }

}
