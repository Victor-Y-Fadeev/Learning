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
			Automaton fsa = new Automaton();
			string toCheck = "-1";

			Console.WriteLine("Checking \"" + toCheck + "\", result is " + fsa.CheckWord(toCheck));
		}
	}
}
