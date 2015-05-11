## ADMIN

### 1. Get Tour Categories

```bash
GET http://<domain_name>/api/tour_categories?api_key=<api_key>&auth_token=<auth_token>&page=<page>&keyword=<keyword>
```

* Sample JSON:

```bash
{

    "tour_categories":[
        {
            "id":1,
            "name":"Daily Local Tours"
        },
        {
            "id":2,
            "name":"Wildlife Adventures"
        }
    ],
    "total_page":1,
    "current_page":1

}
```

### 2. Create Tour Category

```bash
POST http://<domain_name>/api/tour_categories?tour_category=<tour_category>
```
* ``tour_category``: [name]

* Sample JSON:

```bash
{
    "status":"successful"
}
```

### 3. Edit Tour Category

```bash
POST http://<domain_name>/api/tour_categories/<tour_category_id>/edit
```
* ``tour_category_id``: id of tour category
* Sample JSON:

```bash
{

    "id":1,
    "name":"Daily Local Tours"

}
```

### 4. Update Tour Category

```bash
PUT http://<domain_name>/api/tour_categories?tour_category=<tour_category>
```
* ``tour_category``: [name]

* Sample JSON:

```bash
{
    "status":"successful"
}
```

### 5. Get Tours

```bash
GET http://<domain_name>/api/tours?api_key=<api_key>&auth_token=<auth_token>&page=<page>&keyword=<keyword>&tour_category_id=<tour_category_id>
```

* Sample JSON:

```bash
{

    "tours":[
        {
            "id":1,
            "name":"WHITE WATER RAFTING - KIULU (GRADE 1-2)",
            "code":"ABK-AWR01",
            "tour_category":"Daily Local Tours"
        }
    ],
    "total_page":1,
    "current_page":1

}
```

### 6. Create Tour

```bash
POST http://<domain_name>/api/tour_categories?tour=<tour>
```
* ``tour``: [name, code, tour_category_id]

* Sample JSON:

```bash
{
    "status":"successful"
}
```

### 7. Edit Tour

```bash
POST http://<domain_name>/api/tour/<tour_id>/edit
```
* ``tour_category_id``: id of tour category
* Sample JSON:

```bash
{

    "id":1,
    "name":"WHITE WATER RAFTING - KIULU (GRADE 1-2)",
    "code":"ABK-AWR01",
    "tour_category":"Daily Local Tours"

}
```

### 8. Update Tour

```bash
PUT http://<domain_name>/api/tour_categories?tour=<tour>
```
* ``tour``: [name, code, tour_category_id]a

* Sample JSON:

```bash
{
    "status":"successful"
}
```