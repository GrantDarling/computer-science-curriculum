using System;

namespace Number_Guessing
{
    class Program
    {
        static void Main(string[] args)
        {
            Random random = new Random();
            int randomNumber = random.Next(0, 11);
            bool win = false;

            Console.WriteLine("Guess A Number Between 1 and 10: ");

            while (win == false)
            {
                string guess = Console.ReadLine();
                int intGuess = Int32.Parse(guess);

                if (randomNumber == intGuess)
                {
                    Console.WriteLine("Correct!");
                    win = true;
                }
                else if (randomNumber > intGuess)
                {
                    Console.WriteLine("Too low! Guess higher...");
                }
                else
                {
                    Console.WriteLine("Too high! Guess lower...");
                }
            }
            Console.WriteLine($"number is {randomNumber}!");
        }
    }
}

