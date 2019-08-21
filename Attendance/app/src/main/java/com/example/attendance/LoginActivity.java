package com.example.attendance;


import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class LoginActivity extends AppCompatActivity {
    ProgressDialog progressDialog;
    EditText username,password;
    Button loginButton;
    private String baseUrl;
    private String Uname;
    private String Upass;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        baseUrl = Constants.URL_LOGIN;
        username = (EditText) findViewById(R.id.et_password);
        password = (EditText) findViewById(R.id.et_username);
        progressDialog = new ProgressDialog(this);
        loginButton = (Button) findViewById(R.id.bt_login);


        loginButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Uname = username.getText().toString();
                Upass = password.getText().toString();
                login();
                emptyInputEditText();
            }
        });
    }
    //login function

    public void login() {

        progressDialog.setMessage("Login...");
        progressDialog.show();

        StringRequest stringRequest = new StringRequest(Request.Method.POST,
                baseUrl,
                new Response.Listener<String>() {

                    @Override
                    public void onResponse(String response) {
                        Log.d("LoginActivity", response.toString());
                        progressDialog.dismiss();

                        try {
                            JSONObject jsonObject = new JSONObject(response);
                            if (!jsonObject.getBoolean("error")) {

                                goToMainActivity();

                                Toast.makeText(getApplicationContext(), jsonObject.getString("message"), Toast.LENGTH_LONG).show();

                            } else {
                                Toast.makeText(getApplicationContext(), jsonObject.getString("message"), Toast.LENGTH_LONG).show();
                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                }, new Response.ErrorListener() {

            @Override
            public void onErrorResponse(VolleyError error) {
                progressDialog.dismiss();
                VolleyLog.d("LoginActivity", "Error: " + error.getMessage());
                Toast.makeText(getApplicationContext(), "Error: " + error.getMessage(), Toast.LENGTH_LONG).show();
            }
        }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String> params = new HashMap<>();
                params.put("username", Uname);
                params.put("password", Upass);
                return params;
            }
        };

        // Adding request to request queue
        RequestHandler.getInstance(this).addToRequestQueue(stringRequest);
    }

    //open new activity window
    private void goToMainActivity(){
        Bundle bundle = new Bundle();
        bundle.putString("UserName", Uname);
        bundle.putString("Password", Upass);
        bundle.putString("baseUrl", baseUrl);

        Intent intent = new Intent(this, MainActivity.class);
        intent.putExtras(bundle);
        startActivity(intent);

    }

    private void emptyInputEditText() {
        username.setText(null);
        password.setText(null);

    }
}
