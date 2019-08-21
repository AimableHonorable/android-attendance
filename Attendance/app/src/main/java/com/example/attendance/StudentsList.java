package com.example.attendance;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.StrictMode;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.google.gson.Gson;

import org.apache.http.HttpConnection;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentsList extends AppCompatActivity {

    String urladdress = Constants.URL_Attendance;
    TextView studentId, WorkloadID;
    String[] regNo;
    String[] StdCard;
    String[] WId;
    boolean status;
    ListView listView;
    Switch aSwitch;
    Button Submit;
    ProgressDialog progressDialog;
    BufferedInputStream is;
    String line = null;
    String result = null;
    List<CustomListview> dataArray;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_students_list);

        listView = (ListView) findViewById(R.id.lv_list);
        studentId = (TextView) findViewById(R.id.tv_stCard);
        WorkloadID = (TextView) findViewById(R.id.tv_wId);
        aSwitch = (Switch) findViewById(R.id.sw_student);

        Submit = (Button) findViewById(R.id.save_attendance);

        StrictMode.setThreadPolicy((new StrictMode.ThreadPolicy.Builder().permitNetwork().build()));
        collectData();

        final CustomListview customListview = new CustomListview(this, regNo, StdCard, WId, status);
        listView.setAdapter(customListview);

        Submit.setOnClickListener(new View.OnClickListener() {
            @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
            @Override
            public void onClick(View view) {
                for (int i = 0; i < customListview.getCount(); i++){
                        saveAttendance();
                    }
            }
        });
    }

    private void collectData() {
        //connection
        try {
            URL url = new URL(urladdress);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            is = new BufferedInputStream(con.getInputStream());

        } catch (Exception ex) {
            ex.printStackTrace();
        }
//content
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            StringBuilder sb = new StringBuilder();
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
            }
            is.close();
            result = sb.toString();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        //JSON
        try {
            JSONArray ja = new JSONArray(result);
            JSONObject jo = null;
            regNo = new String[ja.length()];
            StdCard = new String[ja.length()];
            WId = new String[ja.length()];

            for (int i = 0; i < ja.length(); i++) {
                jo = ja.getJSONObject(i);
                regNo[i] = jo.getString("RegistrationNumber");
                StdCard[i] = jo.getString("Std_ID");
                WId[i] = jo.getString("Workload_ID");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    //save data
    @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
    private void saveAttendance(){
        final String Std_id = studentId.getText().toString().trim();
        final String workload = WorkloadID.getText().toString().trim();
        final boolean stat = aSwitch.getShowText();
        final String status = String.valueOf(stat);

        progressDialog.setMessage("please wait....");
        progressDialog.show();

        Log.i( "saveAttendance()", " was invoked");

        StringRequest stringRequest=new StringRequest(Request.Method.POST, Constants.URL_Submit, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                progressDialog.dismiss();

                try {
                    JSONObject jsonObject=new JSONObject(response);
                    Toast.makeText(getApplicationContext(),jsonObject.getString("message"),Toast.LENGTH_LONG).show();
                } catch (JSONException e) {
                    e.printStackTrace();
                    Log.i( "onResponse", e.toString());
                }


            }
        },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        progressDialog.hide();
                        Toast.makeText(getApplicationContext(),error.getMessage(),Toast.LENGTH_LONG).show();

                    }
                }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map <String, String> params = new HashMap<>();
                params.put("Std_ID", Std_id);
                params.put("workload", workload);
                params.put("attendance", status);
                return params;
            }
        };
        RequestHandler.getInstance(this).addToRequestQueue(stringRequest);

    }

}