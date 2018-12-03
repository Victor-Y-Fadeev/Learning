using System.IO;

namespace Coding
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
			string input = File.ReadAllText("expression.txt");

			File.WriteAllText("codes.txt", Lexer.Convolution(input));
		}
	}
}
