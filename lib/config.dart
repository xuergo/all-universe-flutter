import 'package:all_universe_flutter/env.dart';

// 开发环境
const SERVER_HOST_DEV = 'https://mock.apifox.cn/m1/1931946-0-default/api';

// 生产环境
// 生产环境地址禁止随意修改！！！
const SERVER_HOST_PROD = '';

const SERVER_API_URL = ENV_IS_DEV ? SERVER_HOST_DEV : SERVER_HOST_PROD;

const ENV_IS_DEV = ENV == "DEV";

const PUSH_PREFIX = ENV_IS_DEV ? "test_" : "prod_";
