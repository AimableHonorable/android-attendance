package com.example.attendance;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.View;
import android.widget.Button;
import android.widget.ListView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class DailyCourse extends AppCompatActivity implements OnButtonCallAttendanceCallback {

    String urladdress = Constants.URL_Course;
    String[] courseName;
    String[] courseCode;
    String[] Option;
    String[] userName;
    String[] Academic;
    String[] level;
    String[] Semester;
    String[] Credit;
    BufferedInputStream is;
    ListView listView;
    String line = null;
    String result = null;
    Button saveAttendance;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_daily_course);

        listView = (ListView) findViewById(R.id.lv_course);
        saveAttendance = (Button)findViewById(R.id.save_attendance);


        StrictMode.setThreadPolicy((new StrictMode.ThreadPolicy.Builder().permitNetwork().build()));
        collectData();
        CustomCourseview customCourseview = new CustomCourseview(this, courseName,courseCode,Option, userName, Academic, level, Semester, Credit);
        listView.setAdapter(customCourseview);
    }
    private void collectData(){
        //connection
        try {
            URL url = new URL(urladdress);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            is = new BufferedInputStream(con.getInputStream());

        }catch (Exception ex){
            ex.printStackTrace();
        }

        //content
        try{
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            StringBuilder sb = new StringBuilder();
            while ((line = br.readLine()) != null){
                sb.append(line+"\n");
            }
            is.close();
            result = sb.toString();

        }catch (Exception ex){
            ex.printStackTrace();
        }
        //JSON
        try{
            JSONArray ja = new JSONArray(result);
            JSONObject jo = null;
            courseName  = new String [ja.length()];
            courseCode  = new String [ja.length()];
            Option  = new String [ja.length()];
            userName  = new String [ja.length()];
            Academic  = new String [ja.length()];
            level  = new String [ja.length()];
            Semester  = new String [ja.length()];
            Credit  = new String [ja.length()];

            for (int i=0; i<ja.length(); i++){
                jo = ja.getJSONObject(i);
                courseName[i] = jo.getString("CourseName");
                courseCode[i] = jo.getString("CourseCode");
                Option[i] = jo.getString("OptionName");
                userName[i] = jo.getString("UserName");
                Academic[i] = jo.getString("AcademicYearName");
                level[i] = jo.getString("Level");
                Semester[i] = jo.getString("Semester");
                Credit[i] = jo.getString("Credits");

            }
        }catch (Exception ex){
            ex.printStackTrace();
        }

    }

    public void makeAttenance(View view) {
        Intent intent = new Intent(this, StudentsList.class);
        startActivity(intent);
    }

    @Override
    public void onClickListener(String[] attendanceList) {

    }

    @Override
    public void onPointerCaptureChanged(boolean hasCapture) {

    }
}
