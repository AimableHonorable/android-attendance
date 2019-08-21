package com.example.attendance;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

public class CustomCourseview extends ArrayAdapter<String> {

    private  String[] courseName;
    private  String[] courseCode;
    private  String[] Option;
    private  String[] userName;
    private  String[] Academic;
    private  String[] level;
    private  String[] Semester;
    private  String[] Credit;
    private Activity context;
    public CustomCourseview(Activity context, String[] courseName, String[] courseCode, String[] Option, String[] userName, String[] Academic, String[] level, String[] Semester, String[] Credit) {
        super(context, R.layout.layout2,courseName);
        this.context = context;
        this.courseName = courseName;
        this.courseCode = courseCode;
        this.Option = Option;
        this.userName = userName;
        this.Academic = Academic;
        this.level =level;
        this.Semester = Semester;
        this.Credit = Credit;
    }
    @NonNull
    @Override

    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent){
        View r =convertView;
        ViewHolder viewHolder = null;
        if (r == null){
            LayoutInflater layoutInflater = context.getLayoutInflater();
            r = layoutInflater.inflate(R.layout.layout2,null, true);
            viewHolder = new ViewHolder(r);
            r.setTag(viewHolder);
        }else {
            viewHolder = (ViewHolder)r.getTag();
        }

        viewHolder.tv1.setText(courseName[position]);
        viewHolder.tv2.setText(courseCode[position]);
        viewHolder.tv3.setText(Option[position]);
        viewHolder.tv4.setText(userName[position]);
        viewHolder.tv5.setText(Academic[position]);
        viewHolder.tv6.setText(level[position]);
        viewHolder.tv7.setText(Semester[position]);
        viewHolder.tv8.setText(Credit[position]);

        return r;
    }

    class ViewHolder{
        TextView tv1;
        TextView tv2;
        TextView tv3;
        TextView tv4;
        TextView tv5;
        TextView tv6;
        TextView tv7;
        TextView tv8;

        ViewHolder(View v){
            tv1 = (TextView)v.findViewById(R.id.tv_courseName);
            tv2 = (TextView)v.findViewById(R.id.tv_code);
            tv3 = (TextView)v.findViewById(R.id.tv_opt);
            tv4 = (TextView)v.findViewById(R.id.tv_uname);
            tv5 = (TextView)v.findViewById(R.id.tv_year);
            tv6 = (TextView)v.findViewById(R.id.tv_level);
            tv7 = (TextView)v.findViewById(R.id.tv_semester);
            tv8 = (TextView)v.findViewById(R.id.tv_credit);

        }
    }
}
