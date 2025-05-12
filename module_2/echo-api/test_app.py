import requests

def test_echo_status():
    r = requests.get("http://localhost:5000/echo?msg=foo$bar")
    assert r.status_code == 200
    assert r.json()["msg"] == "foo$bar" 

