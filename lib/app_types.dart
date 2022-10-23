import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

typedef QueryMap = QuerySnapshot<Map<String, dynamic>>;
typedef QueryDoc = QueryDocumentSnapshot<Map<String, dynamic>>;
typedef AsyncQuery = AsyncSnapshot<QueryMap>;
typedef MapDynamic = Map<String, dynamic>;