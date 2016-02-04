/* ------------------------------------------------------------------------------
 *
 *  # Echarts - candlestick and other charts
 *
 *  Candlestick and other chart configurations
 *
 *  Version: 1.0
 *  Latest update: August 1, 2015
 *
 * ---------------------------------------------------------------------------- */

$(function () {

    // Set paths
    // ------------------------------

    require.config({
        paths: {
            echarts: 'assets/js/plugins/visualization/echarts'
        }
    });


    // Configuration
    // ------------------------------

    require(

        [
          'echarts',
          'echarts/theme/limitless',
          'echarts/chart/line',
          'echarts/chart/scatter',
          'echarts/chart/k',
          'echarts/chart/radar',
          'echarts/chart/gauge'
        ],


        // Charts setup
        function (ec, limitless) {

            // Initialize charts
            // ------------------------------

            var radar_filled = ec.init(document.getElementById('radar_filled'), limitless);
            // alert('check 1');
            // Charts options
            // ------------------------------


            //
            // Basic candlestick chart
            //

            candlestick_basic_options = {

                // Setup grid
                grid: {
                    x: 55,
                    x2: 55,
                    y: 35,
                    y2: 90
                },

                // Add tooltip
                tooltip: {
                    trigger: 'axis',
                    formatter: function (params) {
                        var res = params[0].seriesName + ' &nbsp;&nbsp;' + params[0].name;
                        res += '<br/>  Opening: ' + params[0].value[0] + ' &nbsp;&nbsp; Highest: ' + params[0].value[3];
                        res += '<br/>  Closing: ' + params[0].value[1] + ' &nbsp;&nbsp; Lowest: ' + params[0].value[2];
                        return res;
                    }
                },

                // Add legend
                legend: {
                    data:['Composite index']
                },

                // Add toolbox
                toolbox: {
                    show: true,
                    x: 'right',
                    y: 35,
                    orient: 'vertical',
                    feature: {
                        mark: {
                            show: true,
                            title: {
                                mark: 'Markline switch',
                                markUndo: 'Undo markline',
                                markClear: 'Clear markline'
                            }
                        },
                        dataZoom: {
                            show: true,
                            title: {
                                dataZoom: 'Data zoom',
                                dataZoomReset: 'Reset zoom'
                            }
                        },
                        dataView: {
                            show: true,
                            readOnly: false,
                            title: 'View data',
                            lang: ['View chart data', 'Close', 'Update']
                        },
                        restore: {
                            show: true,
                            title: 'Restore'
                        },
                        saveAsImage: {
                            show: true,
                            title: 'Same as image',
                            lang: ['Save']
                        }
                    }
                },

                // Enable data zoom
                dataZoom: {
                    show: true,
                    realtime: true,
                    start: 0,
                    end: 50,
                    height: 40
                },

                // Horizontal axis
                xAxis: [{
                    type: 'category',
                    boundaryGap: true,
                    axisTick: {onGap: false},
                    splitLine: {show: false},
                    data: [
                        "2013/1/24", "2013/1/25", "2013/1/28", "2013/1/29", "2013/1/30",
                        "2013/1/31", "2013/2/1", "2013/2/4", "2013/2/5", "2013/2/6",
                        "2013/2/7", "2013/2/8", "2013/2/18", "2013/2/19", "2013/2/20",
                        "2013/2/21", "2013/2/22", "2013/2/25", "2013/2/26", "2013/2/27",
                        "2013/2/28", "2013/3/1", "2013/3/4", "2013/3/5", "2013/3/6",
                        "2013/3/7", "2013/3/8", "2013/3/11", "2013/3/12", "2013/3/13",
                        "2013/3/14", "2013/3/15", "2013/3/18", "2013/3/19", "2013/3/20",
                        "2013/3/21", "2013/3/22", "2013/3/25", "2013/3/26", "2013/3/27",
                        "2013/3/28", "2013/3/29", "2013/4/1", "2013/4/2", "2013/4/3",
                        "2013/4/8", "2013/4/9", "2013/4/10", "2013/4/11", "2013/4/12",
                        "2013/4/15", "2013/4/16", "2013/4/17", "2013/4/18", "2013/4/19",
                        "2013/4/22", "2013/4/23", "2013/4/24", "2013/4/25", "2013/4/26",
                        "2013/5/2", "2013/5/3", "2013/5/6", "2013/5/7", "2013/5/8",
                        "2013/5/9", "2013/5/10", "2013/5/13", "2013/5/14", "2013/5/15",
                        "2013/5/16", "2013/5/17", "2013/5/20", "2013/5/21", "2013/5/22",
                        "2013/5/23", "2013/5/24", "2013/5/27", "2013/5/28", "2013/5/29",
                        "2013/5/30", "2013/5/31", "2013/6/3", "2013/6/4", "2013/6/5",
                        "2013/6/6", "2013/6/7", "2013/6/13"
                    ]
                }],

                // Vertical axis
                yAxis: [{
                    type: 'value',
                    scale: true,
                    boundaryGap: [0.01, 0.01]
                }],

                // Add series
                series: [{
                    name: 'Composite index',
                    type: 'k',
                    itemStyle: {
                        normal: {
                            color: '#607D8B',
                            color0: '#EF5350',
                            lineStyle: {
                                color: '#607D8B',
                                color0: '#EF5350',
                            }
                        }
                    },
                    data: [
                        [2320.26,2302.6,2287.3,2362.94],
                        [2300,2291.3,2288.26,2308.38],
                        [2295.35,2346.5,2295.35,2346.92],
                        [2347.22,2358.98,2337.35,2363.8],
                        [2360.75,2382.48,2347.89,2383.76],
                        [2383.43,2385.42,2371.23,2391.82],
                        [2377.41,2419.02,2369.57,2421.15],
                        [2425.92,2428.15,2417.58,2440.38],
                        [2411,2433.13,2403.3,2437.42],
                        [2432.68,2434.48,2427.7,2441.73],
                        [2430.69,2418.53,2394.22,2433.89],
                        [2416.62,2432.4,2414.4,2443.03],
                        [2441.91,2421.56,2415.43,2444.8],
                        [2420.26,2382.91,2373.53,2427.07],
                        [2383.49,2397.18,2370.61,2397.94],
                        [2378.82,2325.95,2309.17,2378.82],
                        [2322.94,2314.16,2308.76,2330.88],
                        [2320.62,2325.82,2315.01,2338.78],
                        [2313.74,2293.34,2289.89,2340.71],
                        [2297.77,2313.22,2292.03,2324.63],
                        [2322.32,2365.59,2308.92,2366.16],
                        [2364.54,2359.51,2330.86,2369.65],
                        [2332.08,2273.4,2259.25,2333.54],
                        [2274.81,2326.31,2270.1,2328.14],
                        [2333.61,2347.18,2321.6,2351.44],
                        [2340.44,2324.29,2304.27,2352.02],
                        [2326.42,2318.61,2314.59,2333.67],
                        [2314.68,2310.59,2296.58,2320.96],
                        [2309.16,2286.6,2264.83,2333.29],
                        [2282.17,2263.97,2253.25,2286.33],
                        [2255.77,2270.28,2253.31,2276.22],
                        [2269.31,2278.4,2250,2312.08],
                        [2267.29,2240.02,2239.21,2276.05],
                        [2244.26,2257.43,2232.02,2261.31],
                        [2257.74,2317.37,2257.42,2317.86],
                        [2318.21,2324.24,2311.6,2330.81],
                        [2321.4,2328.28,2314.97,2332],
                        [2334.74,2326.72,2319.91,2344.89],
                        [2318.58,2297.67,2281.12,2319.99],
                        [2299.38,2301.26,2289,2323.48],
                        [2273.55,2236.3,2232.91,2273.55],
                        [2238.49,2236.62,2228.81,2246.87],
                        [2229.46,2234.4,2227.31,2243.95],
                        [2234.9,2227.74,2220.44,2253.42],
                        [2232.69,2225.29,2217.25,2241.34],
                        [2196.24,2211.59,2180.67,2212.59],
                        [2215.47,2225.77,2215.47,2234.73],
                        [2224.93,2226.13,2212.56,2233.04],
                        [2236.98,2219.55,2217.26,2242.48],
                        [2218.09,2206.78,2204.44,2226.26],
                        [2199.91,2181.94,2177.39,2204.99],
                        [2169.63,2194.85,2165.78,2196.43],
                        [2195.03,2193.8,2178.47,2197.51],
                        [2181.82,2197.6,2175.44,2206.03],
                        [2201.12,2244.64,2200.58,2250.11],
                        [2236.4,2242.17,2232.26,2245.12],
                        [2242.62,2184.54,2182.81,2242.62],
                        [2187.35,2218.32,2184.11,2226.12],
                        [2213.19,2199.31,2191.85,2224.63],
                        [2203.89,2177.91,2173.86,2210.58],
                        [2170.78,2174.12,2161.14,2179.65],
                        [2179.05,2205.5,2179.05,2222.81],
                        [2212.5,2231.17,2212.5,2236.07],
                        [2227.86,2235.57,2219.44,2240.26],
                        [2242.39,2246.3,2235.42,2255.21],
                        [2246.96,2232.97,2221.38,2247.86],
                        [2228.82,2246.83,2225.81,2247.67],
                        [2247.68,2241.92,2231.36,2250.85],
                        [2238.9,2217.01,2205.87,2239.93],
                        [2217.09,2224.8,2213.58,2225.19],
                        [2221.34,2251.81,2210.77,2252.87],
                        [2249.81,2282.87,2248.41,2288.09],
                        [2286.33,2299.99,2281.9,2309.39],
                        [2297.11,2305.11,2290.12,2305.3],
                        [2303.75,2302.4,2292.43,2314.18],
                        [2293.81,2275.67,2274.1,2304.95],
                        [2281.45,2288.53,2270.25,2292.59],
                        [2286.66,2293.08,2283.94,2301.7],
                        [2293.4,2321.32,2281.47,2322.1],
                        [2323.54,2324.02,2321.17,2334.33],
                        [2316.25,2317.75,2310.49,2325.72],
                        [2320.74,2300.59,2299.37,2325.53],
                        [2300.21,2299.25,2294.11,2313.43],
                        [2297.1,2272.42,2264.76,2297.1],
                        [2270.71,2270.93,2260.87,2276.86],
                        [2264.43,2242.11,2240.07,2266.69],
                        [2242.26,2210.9,2205.07,2250.63],
                        [2190.1,2148.35,2126.22,2190.1]
                    ]
                }]
            };


            //
            // Candlestick with line
            //

            candlestick_line_options = {

                // Setup grid
                grid: {
                    x: 55,
                    x2: 85,
                    y: 35,
                    y2: 90
                },

                // Add tooltip
                tooltip: {
                    trigger: 'axis',
                    formatter: function (params) {
                        var res = params[0].name;
                        for (var i = params.length - 1; i >= 0; i--) {
                            if (params[i].value instanceof Array) {
                                res += '<br/>' + params[i].seriesName;
                                res += '<br/> Opening: ' + params[i].value[0] + ' &nbsp;&nbsp; Highest: ' + params[i].value[3];
                                res += '<br/> CLosing: ' + params[i].value[1] + ' &nbsp;&nbsp; Lowest: ' + params[i].value[2];
                            }
                            else {
                                res += '<br/>' + params[i].seriesName;
                                res += ': ' + params[i].value;
                            }
                        }
                        return res;
                    }
                },

                // Add legend
                legend: {
                    data:['Composite index','Turnover (million)']
                },

                // Enable data zoom
                dataZoom: {
                    show: true,
                    realtime: true,
                    start: 25,
                    end: 75,
                    height: 40
                },

                // Horizontal axis
                xAxis: [{
                    type: 'category',
                    boundaryGap: true,
                    axisTick: {onGap: false},
                    splitLine: {show: false},
                    data: [
                        "2013/1/24", "2013/1/25", "2013/1/28", "2013/1/29", "2013/1/30",
                        "2013/1/31", "2013/2/1", "2013/2/4", "2013/2/5", "2013/2/6",
                        "2013/2/7", "2013/2/8", "2013/2/18", "2013/2/19", "2013/2/20",
                        "2013/2/21", "2013/2/22", "2013/2/25", "2013/2/26", "2013/2/27",
                        "2013/2/28", "2013/3/1", "2013/3/4", "2013/3/5", "2013/3/6",
                        "2013/3/7", "2013/3/8", "2013/3/11", "2013/3/12", "2013/3/13",
                        "2013/3/14", "2013/3/15", "2013/3/18", "2013/3/19", "2013/3/20",
                        "2013/3/21", "2013/3/22", "2013/3/25", "2013/3/26", "2013/3/27",
                        "2013/3/28", "2013/3/29", "2013/4/1", "2013/4/2", "2013/4/3",
                        "2013/4/8", "2013/4/9", "2013/4/10", "2013/4/11", "2013/4/12",
                        "2013/4/15", "2013/4/16", "2013/4/17", "2013/4/18", "2013/4/19",
                        "2013/4/22", "2013/4/23", "2013/4/24", "2013/4/25", "2013/4/26",
                        "2013/5/2", "2013/5/3", "2013/5/6", "2013/5/7", "2013/5/8",
                        "2013/5/9", "2013/5/10", "2013/5/13", "2013/5/14", "2013/5/15",
                        "2013/5/16", "2013/5/17", "2013/5/20", "2013/5/21", "2013/5/22",
                        "2013/5/23", "2013/5/24", "2013/5/27", "2013/5/28", "2013/5/29",
                        "2013/5/30", "2013/5/31", "2013/6/3", "2013/6/4", "2013/6/5",
                        "2013/6/6", "2013/6/7", "2013/6/13"
                    ]
                }],

                // Vertical axis
                yAxis: [
                    {
                        type: 'value',
                        scale: true,
                        splitNumber: 5,
                        boundaryGap: [0.01, 0.01]
                    },
                    {
                        type: 'value',
                        scale: true,
                        splitNumber: 5,
                        boundaryGap: [0.05, 0.05]
                    }
                ],

                // Add series
                series: [
                    {
                        name: 'Turnover (million)',
                        type: 'line',
                        yAxisIndex: 1,
                        symbol: 'none',
                        data: [
                            13560434, 8026738.5, 11691637, 12491697, 12485603,
                            11620504, 12555496, 15253370, 12709611, 10458354,
                            10933507, 9896523, 10365702, 10633095, 9722230,
                            12662783, 8757982, 7764234, 10591719, 8826293,
                            11591827, 11153111, 14304651, 11672120, 12536480,
                            12608589, 8843860, 7391994.5, 10063709, 7768895.5,
                            6921859, 10157810, 8148617.5, 7551207, 11397426,
                            10478607, 8595132, 8541862, 9181132, 8570842,
                            10759351, 7335819, 6699753.5, 7759666.5, 6880135.5,
                            7366616.5, 7313504, 7109021.5, 6213270, 5619688,
                            5816217.5, 6695584.5, 5998655.5, 6188812.5, 9538301,
                            8224500, 8221751.5, 7897721, 8448324, 6525151,
                            5987761, 7831570, 8162560.5, 7904092, 8139084.5,
                            9116529, 8128014, 7919148, 7566047, 6665826.5,
                            10225527, 11124881, 12884353, 11302521, 11529046,
                            11105205, 9202153, 9992016, 12035250, 11431155,
                            10354677, 10070399, 9164861, 9237718, 7114268,
                            7526158.5, 8105835, 7971452.5
                        ],

                        markPoint: {
                            symbol: 'emptyPin',
                            itemStyle: {
                                normal: {
                                    color: '#1e90ff'
                                }
                            },
                            data: [
                                {
                                    type: 'max',
                                    name: 'Maximum',
                                    symbolSize: 5,
                                    itemStyle: {
                                        normal: {
                                            label: {
                                                position: 'top'
                                            }
                                        }
                                    }
                                },
                                {
                                    type: 'min',
                                    name: 'Minimum',
                                    symbolSize: 5,
                                    itemStyle: {
                                        normal: {
                                            label: {
                                                position: 'top',
                                            }
                                        }
                                    }
                                }
                            ]
                        },

                        markLine: {
                            symbol: 'none',
                            itemStyle: {
                                normal: {
                                    color: '#1e90ff',
                                    label: {
                                        show: true
                                    }
                                }
                            },
                            data: [{
                                type: 'average',
                                name: 'Average'
                            }]
                        }
                    },

                    {
                        name: 'Composite index',
                        type: 'k',
                        itemStyle: {
                            normal: {
                                color: '#66BB6A',
                                color0: '#FF7043',
                                lineStyle: {
                                    color: '#66BB6A',
                                    color0: '#FF7043',
                                }
                            }
                        },
                        data: [
                            [2320.26,2302.6,2287.3,2362.94],
                            [2300,2291.3,2288.26,2308.38],
                            [2295.35,2346.5,2295.35,2346.92],
                            [2347.22,2358.98,2337.35,2363.8],
                            [2360.75,2382.48,2347.89,2383.76],
                            [2383.43,2385.42,2371.23,2391.82],
                            [2377.41,2419.02,2369.57,2421.15],
                            [2425.92,2428.15,2417.58,2440.38],
                            [2411,2433.13,2403.3,2437.42],
                            [2432.68,2434.48,2427.7,2441.73],
                            [2430.69,2418.53,2394.22,2433.89],
                            [2416.62,2432.4,2414.4,2443.03],
                            [2441.91,2421.56,2415.43,2444.8],
                            [2420.26,2382.91,2373.53,2427.07],
                            [2383.49,2397.18,2370.61,2397.94],
                            [2378.82,2325.95,2309.17,2378.82],
                            [2322.94,2314.16,2308.76,2330.88],
                            [2320.62,2325.82,2315.01,2338.78],
                            [2313.74,2293.34,2289.89,2340.71],
                            [2297.77,2313.22,2292.03,2324.63],
                            [2322.32,2365.59,2308.92,2366.16],
                            [2364.54,2359.51,2330.86,2369.65],
                            [2332.08,2273.4,2259.25,2333.54],
                            [2274.81,2326.31,2270.1,2328.14],
                            [2333.61,2347.18,2321.6,2351.44],
                            [2340.44,2324.29,2304.27,2352.02],
                            [2326.42,2318.61,2314.59,2333.67],
                            [2314.68,2310.59,2296.58,2320.96],
                            [2309.16,2286.6,2264.83,2333.29],
                            [2282.17,2263.97,2253.25,2286.33],
                            [2255.77,2270.28,2253.31,2276.22],
                            [2269.31,2278.4,2250,2312.08],
                            [2267.29,2240.02,2239.21,2276.05],
                            [2244.26,2257.43,2232.02,2261.31],
                            [2257.74,2317.37,2257.42,2317.86],
                            [2318.21,2324.24,2311.6,2330.81],
                            [2321.4,2328.28,2314.97,2332],
                            [2334.74,2326.72,2319.91,2344.89],
                            [2318.58,2297.67,2281.12,2319.99],
                            [2299.38,2301.26,2289,2323.48],
                            [2273.55,2236.3,2232.91,2273.55],
                            [2238.49,2236.62,2228.81,2246.87],
                            [2229.46,2234.4,2227.31,2243.95],
                            [2234.9,2227.74,2220.44,2253.42],
                            [2232.69,2225.29,2217.25,2241.34],
                            [2196.24,2211.59,2180.67,2212.59],
                            [2215.47,2225.77,2215.47,2234.73],
                            [2224.93,2226.13,2212.56,2233.04],
                            [2236.98,2219.55,2217.26,2242.48],
                            [2218.09,2206.78,2204.44,2226.26],
                            [2199.91,2181.94,2177.39,2204.99],
                            [2169.63,2194.85,2165.78,2196.43],
                            [2195.03,2193.8,2178.47,2197.51],
                            [2181.82,2197.6,2175.44,2206.03],
                            [2201.12,2244.64,2200.58,2250.11],
                            [2236.4,2242.17,2232.26,2245.12],
                            [2242.62,2184.54,2182.81,2242.62],
                            [2187.35,2218.32,2184.11,2226.12],
                            [2213.19,2199.31,2191.85,2224.63],
                            [2203.89,2177.91,2173.86,2210.58],
                            [2170.78,2174.12,2161.14,2179.65],
                            [2179.05,2205.5,2179.05,2222.81],
                            [2212.5,2231.17,2212.5,2236.07],
                            [2227.86,2235.57,2219.44,2240.26],
                            [2242.39,2246.3,2235.42,2255.21],
                            [2246.96,2232.97,2221.38,2247.86],
                            [2228.82,2246.83,2225.81,2247.67],
                            [2247.68,2241.92,2231.36,2250.85],
                            [2238.9,2217.01,2205.87,2239.93],
                            [2217.09,2224.8,2213.58,2225.19],
                            [2221.34,2251.81,2210.77,2252.87],
                            [2249.81,2282.87,2248.41,2288.09],
                            [2286.33,2299.99,2281.9,2309.39],
                            [2297.11,2305.11,2290.12,2305.3],
                            [2303.75,2302.4,2292.43,2314.18],
                            [2293.81,2275.67,2274.1,2304.95],
                            [2281.45,2288.53,2270.25,2292.59],
                            [2286.66,2293.08,2283.94,2301.7],
                            [2293.4,2321.32,2281.47,2322.1],
                            [2323.54,2324.02,2321.17,2334.33],
                            [2316.25,2317.75,2310.49,2325.72],
                            [2320.74,2300.59,2299.37,2325.53],
                            [2300.21,2299.25,2294.11,2313.43],
                            [2297.1,2272.42,2264.76,2297.1],
                            [2270.71,2270.93,2260.87,2276.86],
                            [2264.43,2242.11,2240.07,2266.69],
                            [2242.26,2210.9,2205.07,2250.63],
                            [2190.1,2148.35,2126.22,2190.1]
                        ]
                    }
                ]
            };



            //
            // Filled radar chart
            //

            radar_filled_options = {

                // Add title
                title: {
                },

                // Add tooltip
                tooltip: {
                    trigger: 'axis'
                },

                // Add legend
                legend: {
                    orient: 'vertical',
                    x: 'left',
                    data: ['平均','自社']
                },

                // Enable drag recalculate
                calculable: true,

                // Setup polar coordinates
                polar: [{
                    radius: '80%',
                    indicator: [
                        {text: '対応の丁寧さ', max: 5},
                        {text: '契約までの速さ', max: 5},
                        {text: '仕上がりの丁寧さ', max: 5},
                        {text: '納品までの早さ', max: 5},
                        {text: '価格', max: 5},
                    ],
                }],

                // Add series
                series: [{
                    name: '平均 vs 自社',
                    type: 'radar',
                    itemStyle: {
                        normal: {
                            areaStyle: {
                                type: 'default'
                            }
                        }
                    },
                    data: [
                        {
                            value: [gon.avg1, gon.avg2, gon.avg3, gon.avg4, gon.avg5],
                            name: '平均'
                        },
                        {
                            value: [gon.score1, gon.score2, gon.score3, gon.score4, gon.score5],
                            name: '自社'
                        }
                    ]
                }]
            };


            // Apply options
            // ------------------------------
            // alert('check a');


            radar_filled.setOption(radar_filled_options);
            // alert('check b');
            // Resize charts
            // ------------------------------

            window.onresize = function () {
                setTimeout(function (){
                    radar_filled.resize();
                }, 200);
            }
        }
    );
});
