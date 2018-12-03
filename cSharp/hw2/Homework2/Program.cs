using System;

namespace Homework2
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
			int k = Numbering.KNumbering(36, 10);
			Console.WriteLine("K(" + Numbering.IReverse(k).ToString() + ", " + Numbering.JReverse(k).ToString() + ") = " + k.ToString());

			int[] triple = Numbering.Сonvolution(1000);
			Console.WriteLine("J(" + triple[0].ToString() + ", " + triple[1].ToString() + ", " + triple[2].ToString() + ") = 1000");

			string str = "word";
			Console.WriteLine("\"" + str + "\" number is " + Numbering.WordNumbering(str));
		}
	}
}
