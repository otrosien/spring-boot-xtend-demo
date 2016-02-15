package hello

import org.slf4j.LoggerFactory
import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.context.annotation.Bean
import org.springframework.boot.CommandLineRunner

@SpringBootApplication
class Application {

    static val log = LoggerFactory::getLogger(Application)

    def static void main(String[] args) {
        SpringApplication.run(Application, args)
    }

    @Bean
    def CommandLineRunner init(CustomerRepository repository) {
        [
            repository.save(new Customer => [
                firstName = 'Jack'; lastName  = 'Bauer'
            ])
            repository.save(new Customer => [
                firstName = 'Chloe'; lastName  =  "O'Brian"
            ])
            repository.save(new Customer => [
                firstName = 'Kim'; lastName = 'Bauer'
            ])
            repository.save(new Customer => [
                firstName = 'David'; lastName = 'Palmer'
            ])
            repository.save(new Customer => [
                firstName = 'Michelle'; lastName = 'Dessler'
            ])

            log.info('Customers found with findAll():')
            log.info('-------------------------------')
            repository.findAll().forEach [ customer |
                log.info(customer.toString)
            ]

            val customerId = repository.findAll().findFirst[true].id
            val customer = repository.findOne(customerId)
            log.info('Customer found with findOne():')
            log.info('--------------------------------')
            log.info(customer.toString)
            log.info('')

            log.info('''Customers found with findByLastName('Bauer'):''')
            log.info('--------------------------------------------')
            repository.findByLastName('Bauer').forEach [ bauer |
                log.info(bauer.toString)
            ]
        ]
    }

}
