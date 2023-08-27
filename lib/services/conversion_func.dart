// given two timings, get the time differnce as string
String time_differece_func(int time_diff)
{
  int q= time_diff~/60;
  int r=time_diff%60;
  String ans;
  if(q!=0)
  ans=q.toString()+" hr "+r.toString()+" mins ";
  else
    ans=r.toString()+" mins ";
  return ans;
}