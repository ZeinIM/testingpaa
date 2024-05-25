namespace m7.Models
{
    public class User
    {
    }
}

namespace m7_paa
{
    public class Person
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public int Age { get; set; }

        public static List<Person> people = new List<Person>
        {
            new Person { Id = 1,Name = "bima", Age = 30},
            new Person { Id = 2,Name = "yoga", Age = 25},
            new Person { Id = 3,Name = "ciko", Age = 40},
            new Person { Id = 4,Name = "wudd", Age = 35},
        };
    }

    public class Detail
    {
        public int Saldo { get; set; }

        public int Hutang { get; set; }

    }
    public class PersonDetail : Person
    {
        public Detail? Detail { get; set; }
    }
}
