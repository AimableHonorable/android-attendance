package com.vpnr.finalproject.mytest;


import android.app.ProgressDialog;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

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
     EditText officerEmail,officerPassword;
     Button btnLogin,btnRegister;
    private String baseUrl;
    private String email;
    private String password;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.login_activity);
        baseUrl = "http://192.168.137.1/VPNRFinalAPI/login-pdo-format.php";
        officerEmail = (EditText) findViewById(R.id.officer_email);
        officerPassword = (EditText) findViewById(R.id.officer_password);
        progressDialog = new ProgressDialog(this);
        btnLogin = (Button) findViewById(R.id.btn_Login);
        btnRegister = (Button) findViewById(R.id.btn_Register);

        btnRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent=new Intent(LoginActivity.this, RegisterOfficerActivity.class);
                startActivity(intent);
            }
        });
        btnLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                    email = officerEmail.getText().toString();
                    password = officerPassword.getText().toString();
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
                params.put("officer_email", email);
                params.put("officer_password", password);
                return params;
            }
        };

        // Adding request to request queue
        RequestHandler.getInstance(this).addToRequestQueue(stringRequest);
    }

    //open new activity window
    private void goToMainActivity(){
        Bundle bundle = new Bundle();
        bundle.putString("email", email);
        bundle.putString("password", password);
        bundle.putString("baseUrl", baseUrl);

        Intent intent = new Intent(this, AdminPage_Activity.class);
        intent.putExtras(bundle);
        startActivity(intent);

    }

    private void emptyInputEditText() {
        officerEmail.setText(null);
        officerPassword.setText(null);

    }
}
