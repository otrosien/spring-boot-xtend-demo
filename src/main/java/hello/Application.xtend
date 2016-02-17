package hello

import org.springframework.boot.CommandLineRunner
import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.context.annotation.Bean

@SpringBootApplication
class Application {

    def static void main(String[] args) {
        SpringApplication.run(Application, args)
    }

    @Bean
    def CommandLineRunner init(CustomerRepository repository) {
        [
            initData(repository)
            reportData(repository)
        ]
    }

    private def reportData(CustomerRepository repository) {
        println('''
                    
                    Customers found with findAll():
                    -------------------------------''')
                repository.findAll().forEach [
                    println('''«id»: «firstName» «lastName»''')
                ]

                repository.findAll().findFirst[true] => [
                    repository.findOne(id) => [
                        println('''
                        
                        Customer found with findOne('«id»'):
                        -------------------------------- 
                        «id»: «firstName» «lastName»''')
                    ]
                ]

                println('''
                
                Customers found with findByLastName('Bauer'):
                --------------------------------------------''')
                repository.findByLastName('Bauer').forEach [
                    println('''«id»: «firstName» «lastName»''')
                ]
}

    private def initData(CustomerRepository repository) {
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
    }

}
