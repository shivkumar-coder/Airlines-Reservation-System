import java.util.Scanner;

public class Sample {
	static String removeVowel(String s) {
		   StringBuffer res=new StringBuffer("");
		   int n=s.length();
		   for(int i=0;i<n;i++) {
			   if(!isVowel(s.charAt(i))){
				   res.append(s.charAt(i));
			   }
		   }
		   return new String(res);
	   }
	   static boolean   isVowel(char c) {
		   return c=='a'||c=='e'||c=='i'||c=='o'||c=='u'||c=='A'||c=='E'||c=='I'||c=='O'
				   ||c=='U';
	   }
	   static boolean containsVowel(String s) {
		   
		   for(int i=0;i<s.length();i++) {
			    if(isVowel(s.charAt(i)))
			    	return true;
		   }
		   return false;
	   }
	   static String removeWordswithVowel(String s) {
		   String[]arr=s.split(" ");
		   String res="";
		   for(int i=0;i<arr.length;i++) {
			   if(!containsVowel(arr[i]))
				   res+=arr[i]+" ";
		   }
		   return res;
	   }
	   static void palindromicSubstrings(String s) {
		   int n=s.length();
		   for(int i=0;i<n;i++) {
			   for(int j=i+1;j<=n;j++) {
				   String sub=s.substring(i,j);
				   if(isPalindrome(sub)) 
					   System.out.print(sub+",");
				  
			   }
		   }
	   }
	   static boolean isPalindrome(String s) {
		   int i=0,j=s.length()-1;
		   while(i<j) {
			   if(s.charAt(i)!=s.charAt(j))
				    return false;
			   i++;j--;
		   }
		   return true;
	   }
		public static void main(String[]args)throws Exception {
			Scanner sc=new Scanner(System.in);
			String s=sc.nextLine();
			palindromicSubstrings(s);
		}

}
