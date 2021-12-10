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
    [HideInInspector]public GameObject ballObj;
    public List<GameObject> spawnedBalls;
    void Awake ()
    {
        instance = this;
        //spawnedBalls = new List<GameObject>();
        

    }

    void Start ()
    {
        poolManager = PoolManager.instance;   
    }

    // Update is called once per frame
    void Update ()
    {

    }

    void OnTriggerEnter (Collider other)
    {
        if (other.CompareTag("Gate"))
        {
            ballCount++;
            //tag = "Used";
        }
    }

    public void GenerateBalls (int num)
    {
        for (int i = 0; i < num; i++)
        {
            //print(poolManager.SpawnFromPool());
            ballObj = poolManager.SpawnFromPool();
            ballObj.SetActive(true);
            ballObj.transform.position = transform.position;
            spawnedBalls.Add(ballObj);
            ballObj.GetComponent<Rigidbody>().AddForce(this.transform.forward * 100f, ForceMode.Impulse);
            print("Yeah");
            ballCount++;  
            
        }
    }
}
