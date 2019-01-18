using System;
using System.Collections.Generic;
using System.Text;

namespace Test4
{
	/// <summary>
	/// The Graph class
	/// </summary>
	public class Graph
	{
		private Node head;
		private Node tail;

		public Graph(char symbol)
		{
			head = new Node('\0');
			tail = new Node('\0');

			Node node = new Node(symbol);
			head.Edges.Add(node);
			node.Edges.Add(tail);
			tail.Edges.Add(node);
		}

		public Graph(string str)
		{
			head = new Node('\0');
			tail = new Node('\0');

			head.Edges.Add(tail);
			tail.Edges.Add(head);

			for (int i = 0; i < str.Length; i++)
			{
				switch (str[i])
				{
					case ',':

						break;
					case ';':

						break;
					case '#':

						break;
					default:

						break;
				}
			}
		}

		public void Comma(Graph add)
		{
			foreach (Node node in tail.Edges)
			{
				node.Edges.Remove(tail);
				node.Edges.IntersectWith(add.head.Edges);
			}

			tail = add.tail;
		}

		public void Colon(Graph add)
		{
			head.Edges.IntersectWith(add.head.Edges);

			tail.Edges.IntersectWith(add.tail.Edges);
			foreach (Node node in add.tail.Edges)
			{
				node.Edges.Remove(add.tail);
				node.Edges.Add(tail);
			}
		}

		public void Grid(Graph add)
		{
			foreach (Node node in tail.Edges)
			{
				node.Edges.IntersectWith(add.head.Edges);
			}
			
			foreach (Node node in add.tail.Edges)
			{
				node.Edges.Remove(add.tail);
				node.Edges.IntersectWith(head.Edges);
			}
		}

		private class Node
		{
			public char Symbol { get; }
			public HashSet<Node> Edges { get; }

			public Node(char symbol)
			{
				this.Symbol = symbol;
				this.Edges = new HashSet<Node>();
			}
		}
	}
}
