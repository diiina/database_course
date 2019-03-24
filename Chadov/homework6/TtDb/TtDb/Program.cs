using System;
using System.Linq;
using static System.Console;

namespace TtDb
{
    class Program
    {
        static void Main(string[] args)
        {
            var context = new SomebodyWrongContext();
            WriteLine(context.Users.Count());
            
            var rand = new Random();
            for (var i = 1; i <= 100; i++)
            {
                var u = new User
                {
                    Email = $"{i}_mail@mail.ru",
                    Name = $"user_{i}",
                    Score = i * 100,
                    WalletScore = i * 10,
                    DateBirth = GetRandomDate(new DateTime(1970, 1, 1), DateTime.Now),
                    RegDttm = GetRandomDate(new DateTime(2018, 8, 1), DateTime.Now),
                };
                var t = new Topic
                {
                    Description = GetRandomString(rand.Next(100, 1000)),
                    DialogsCount = rand.Next(100),
                    Name = $"Topic_{i}"
                };
                context.Users.Add(u);
                context.Topic.Add(t);
            }

            context.SaveChanges();

            WriteLine(context.Users.Count());
            WriteLine("Hello World!");
        }

        static DateTimeOffset GetRandomDate(DateTime from, DateTime to)
        {
            if (from >= to)
            {
                throw new Exception("Параметр \"from\" должен быть меньше параметра \"to\"!");
            }
            var random = new Random();
            int daysDiff = (to - from).Days;
            return from.AddDays(random.Next(daysDiff));
        }

        static string GetRandomString(int length)
        {
            var rand = new Random();
            var letters = "123qweasdzxc 456rtyfghvbn 789uiojklm,. 0p;/'][";
            char[] pwd = new char[length];
            for (int i = 0; i < pwd.Length; i++)
                pwd[i] = letters[rand.Next(letters.Length)];
            return new string(pwd);
        }
    }
}
