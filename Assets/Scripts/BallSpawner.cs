using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BallSpawner : MonoBehaviour
{
    // Start is called before the first frame update
    public static BallSpawner instance;
    PoolManager poolManager;

    public int ballCount;

    private Rigidbody rb;

    void Start ()
    {
        instance = this;
        poolManager = PoolManager.instance;
        ballCount = 0;
    }

    // Update is called once per frame
    void Update ()
    {

    }

    void OnTriggerEnter (Collider other)
    {
        if (other.CompareTag("Gate"))
        {

            //tag = "Used";
        }
    }

    public void GenerateBalls (int num)
    {
        //spawnPos = transform.position; 

        for (int i = 0; i < num; i++)
        {
            GameObject ballObj = poolManager.SpawnFromPool();
            ballObj.SetActive(true);
            ballObj.transform.position = transform.position;
            ballObj.GetComponent<Rigidbody>().AddForce(this.transform.forward * 100f, ForceMode.Impulse);
            print("Yeah");
            ballCount++;
            
        }
    }
}
