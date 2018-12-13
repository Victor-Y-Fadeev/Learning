using System;

namespace FSA
{
	/// <summary>
	/// The Program class
	/// </summary>
	public class Program
	{
		/// <summary>
		/// The Main method
		/// </summary>
		/// <param name="args">Input args of programm</param>
		public static void Main(string[] args)
		{
			IAutomaton fsa = new DigitAutomaton();
			Console.Write("Enter number: ");
			string toCheck = Console.ReadLine();
			
			Console.WriteLine("Checking \"" + toCheck + "\", result is " + fsa.CheckWord(toCheck));
		}
	}
}
