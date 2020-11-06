using System;

namespace Number_Guessing
{
    class Program
    {
        static void Main(string[] args)
        {
            Random random = new Random();
            Console.WriteLine("Guess A Number Between 1 and 10: ");
            int mysteryNumber = random.Next(0, 11);
            bool correct = false;

            while (correct == false)
            {
                string guess = Console.ReadLine();
                int intGuess = Int32.Parse(guess);

                if (mysteryNumber == intGuess)
                {
                    Console.WriteLine("Correct!");
                    correct = true;
                }
                else if (mysteryNumber > intGuess)
                {
                    Console.WriteLine("Higher...");
                }
                else
                {
                    Console.WriteLine("Lower...");
                }
            }
            Console.WriteLine($"number is {mysteryNumber}!");
        }
    }
}

