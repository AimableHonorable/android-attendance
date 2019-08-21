package com.example.attendance;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class SelectClass extends AppCompatActivity {

    ArrayList<String> listItems = new ArrayList<>();
    ArrayAdapter adapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_select_class);
        Spinner sp = (Spinner) findViewById(R.id.spinner);
        adapter = new ArrayAdapter<String>(this, R.layout.spinner_layout, R.id.txt, listItems);
        sp.setAdapter(adapter);
    }

    @Override
    protected void onStart() {
        super.onStart();
        BackTask bt = new BackTask();
        bt.execute();
    }

    public void attend(View view) {
        Intent intent = new Intent(this, StudentsList.class);
        startActivity(intent);
    }

    private class BackTask extends AsyncTask<Void, Void, Void>{
        ArrayList<String> list;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            list = new ArrayList<>();
        }
        protected Void doInBackground(Void...params){
            InputStream is = null;
            String result = "";
            try {
                HttpClient httpClient = new DefaultHttpClient();
                HttpPost httpPost = new HttpPost("http://192.168.43.183/api/select/selectStudents.php");
                HttpResponse response = httpClient.execute(httpPost);
                HttpEntity entity = response.getEntity();
                is = entity.getContent();
            }catch (Exception e){
                e.printStackTrace();
            }
            //convert the response to string
            try{
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(is, "utf-8"));
                String line = "";
                while ((line = bufferedReader.readLine()) !=null){
                    result += line;
                }
                is.close();
            }catch (IOException e){
                e.printStackTrace();
            }
            //parse json string
            try{
                JSONArray jsonArray = new JSONArray(result);
                for (int i=0; i<jsonArray.length(); i++){
                    JSONObject jsonObject = jsonArray.getJSONObject(i);
                    list.add(jsonObject.getString("OptionName"));
                }
            }catch (JSONException e){
                e.printStackTrace();
            }
            return null;
        }


        protected void onPostExecute(Void aVoid) {
            listItems.addAll(list);
            adapter.notifyDataSetChanged();
        }
    }
}
