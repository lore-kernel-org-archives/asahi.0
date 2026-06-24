Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99082317158
	for <asahi@lists.linux.dev>; Wed, 24 Jun 2026 06:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782281732; cv=none; b=YVJO7juIdyvNutZ4LSatn5e3nNzEtj3RtOWoVFFn/UP0mPlLrLdEmdZRVLoSnz1TM35La65Ggw0g109jOEg7O2dkwksxx2288WF5OluRuITw/0QER4zW+8wwdRZ3ysdqmmeON7X8GZHdnx2UDoe/yC7o5J6NdQOX0ucOwYE8LQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782281732; c=relaxed/simple;
	bh=aH0b/lOP3E/eHs7Kj9MVmfcQXZdjz79GV7nBpFxLmW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDNl+044/1odQaYgQOpG45T+XDiTe2MR9j8pY6/qt07q/hcgQcCAiHgDisn+bSvLJciOOc/hKvrVLPoSS2KPnvDkVze57gh9ixQyjXnlSTwKyURBRn8l3klCb/D3t1mQ1u4gwpxa0P2YjElVyFIVCCV1VHSc6Yr/oBuBnoYc8YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F0nqQrWv; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F0nqQrWv"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c890110acdaso239060a12.3
        for <asahi@lists.linux.dev>; Tue, 23 Jun 2026 23:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782281731; x=1782886531; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=87QgyDoyxAcN2RlRMsIzcXMwRXx5rS1IvXCP9lPgo4A=;
        b=F0nqQrWvGiutMe4dlo7AyrAkfYSusEiYlLk0s2B2UH2svpEMEivsBlo+wxeZ8+tVqT
         X3wnAleGjBYrO//5PAm5BZFjkWKGi6pLo9Kx/6cn63pSFs9ftfx+9Rv2U/RB2Wndcd7X
         gq/6g6jnlqCq4r1QA+zgY2KI0maeSjQEZzYrR//BiIcTf41ToGJkgweb9H0oCOShI5Te
         OyGGZjb+NA0u8fV6l0VxKu7gLJkjUpl0gH8BISjhA+2E6r50PZWvK1ARzhz4PQe3ZgRc
         3cj8fxJuvhpB7R0M3TeHFWxrLJMXxzDcDsZP+eWpE0HYksX57+zEF3m/veM0woV/naJv
         40ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782281731; x=1782886531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87QgyDoyxAcN2RlRMsIzcXMwRXx5rS1IvXCP9lPgo4A=;
        b=Os6jyn/+AKt7AdVudEfSe0Y4CyZP4Qbo8qQI9+FBBpNJksxrHfZ7+waQHHVvva3n8Y
         A9tDNP2zV6I2RUb5RIVZ+r1H7r144ednXFTnxpDLpmoYNM7K1mV55zQs+jY/dWVDSUlF
         xBNt6IOR9OAdy/kIT80f099S1qokbRyXmffObls/hMt/eV/HbSy4NmqzoTXlo7qC8rYg
         Dqcw6/K55ZqgfDPkl28bItTTt7F4HcmMjBBMyn+ylF4kyxSgOk0ip883LY4WoiWP2I7N
         nZsKftAYbIZSQJuQ5j5tVlzh0YwqO+Kio5bwOBMk6ztMeOR4Vl1fg06P4wXhnnpe0pVu
         5mXw==
X-Forwarded-Encrypted: i=1; AFNElJ/F2HNaIq5b/oMTPornhDMrbxYpQHRW4N91rtkh1VRltqaBl+wANSc3zPUHGwErcvTn++y5Hg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/yfaGZBNkd96flr3HsmYjyDiEFLds/kSj8nfkj2wFaxPEBElz
	VDUk3SagHhF7IgRc3oc1+QYm2M/TwpSxOPZ2iBceY9EdKXso1J21XaM3MOOhbWigpyQ=
X-Gm-Gg: AfdE7cndiR1hjJ5pG3P6mtm/QHK2ustVoOYULo20JNDcOkPa6rp5ED+dpL5kDOPNxrB
	6e+RLQ5PXVT/TIVEZ+dlPSys8xTcSPSKWQxMhViZNeWGSM3HNxvk+XnY1Ff7pBhFUD0neGcQHdR
	Fj17asMZKW7YZH54yvyCfoIj9CT75+D63ALit+VgQg6vLKoHq9qu+HAirjoo3GsfV9kalcA/rww
	ZnncRQTyMcM9ldtl9D9uBHkJsG90x4jr0GEA5ivw7Vunhsgs5dW75WrQfnMQjaGXgdv4L2yjU1/
	8RMmrgarIkZO980ppd/MC+9MBk8RQ06Jakmgkev0wEHk/wcS7b8W7/zE3pNEXQQtktjGLVDvFzo
	Ejash1XsgujrBs4xWntjbBJgaOwbVAZYRPWzb255Iv3aUZvuPrVPSj1K1pkWvnN6gux4woD//ZB
	5xfHCC9LByb0po
X-Received: by 2002:a05:6a21:1bc1:b0:3b4:88e7:87c7 with SMTP id adf61e73a8af0-3bc51c683c9mr19446329637.17.1782281730631;
        Tue, 23 Jun 2026 23:15:30 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc563c131sm13199347a12.18.2026.06.23.23.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 23:15:29 -0700 (PDT)
Date: Wed, 24 Jun 2026 11:45:26 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: sven@kernel.org, j@jannau.net, neal@gompa.dev, rafael@kernel.org, 
	linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sumit.semwal@linaro.org
Subject: Re: [PATCH v2] cpufreq: apple-soc: Fix OPP table cleanup
Message-ID: <x3lom5jew2w4i7aftjxl4qpgupggw74bsjnzqiu5pjbejztti4@j33hgft6gt3b>
References: <20260624033756.2702021-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624033756.2702021-1-haoxiang_li2024@163.com>

On 24-06-26, 11:37, Haoxiang Li wrote:
> dev_pm_opp_of_add_table() adds the DT OPP table but not all failure
> paths remove it. The driver also uses dev_pm_opp_remove_all_dynamic(),
> which is not the right cleanup helper for OPPs loaded from firmware.
> 
> Remove the DT OPP table with dev_pm_opp_of_remove_table() on init
> failure paths and from apple_soc_cpufreq_exit().
> 
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

Please add Fixes and Stable tags.

> diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
> @@ -320,10 +320,10 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
>  	dev_pm_opp_free_cpufreq_table(cpu_dev, &freq_table);
>  out_free_priv:
>  	kfree(priv);
> -out_free_opp:
> -	dev_pm_opp_remove_all_dynamic(cpu_dev);
>  out_iounmap:
>  	iounmap(reg_base);
> +out_remove_opp_table:
> +	dev_pm_opp_of_remove_table(cpu_dev);
>  	return ret;
>  }
>  
> @@ -332,7 +332,7 @@ static void apple_soc_cpufreq_exit(struct cpufreq_policy *policy)
>  	struct apple_cpu_priv *priv = policy->driver_data;
>  
>  	dev_pm_opp_free_cpufreq_table(priv->cpu_dev, &policy->freq_table);
> -	dev_pm_opp_remove_all_dynamic(priv->cpu_dev);
> +	dev_pm_opp_of_remove_table(priv->cpu_dev);
>  	iounmap(priv->reg_base);
>  	kfree(priv);

The order of cleanup calls should match in the above two sequences and there are
other missing pieces as well.

I think this would fix it:

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 9396034167e5..150deae8c31d 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -251,21 +251,19 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
                return -ENODEV;
        }

-       ret = dev_pm_opp_of_add_table(cpu_dev);
-       if (ret < 0) {
-               dev_err(cpu_dev, "%s: failed to add OPP table: %d\n", __func__, ret);
-               return ret;
-       }
+       priv = kzalloc_obj(*priv);
+       if (!priv)
+               return -ENOMEM;

        ret = apple_soc_cpufreq_find_cluster(policy, &reg_base, &info);
        if (ret) {
                dev_err(cpu_dev, "%s: failed to get cluster info: %d\n", __func__, ret);
-               return ret;
+               goto out_priv;
        }

-       ret = dev_pm_opp_set_sharing_cpus(cpu_dev, policy->cpus);
-       if (ret) {
-               dev_err(cpu_dev, "%s: failed to mark OPPs as shared: %d\n", __func__, ret);
+       ret = dev_pm_opp_of_cpumask_add_table(policy->cpus);
+       if (ret < 0) {
+               dev_err(cpu_dev, "%s: failed to add OPP table: %d\n", __func__, ret);
                goto out_iounmap;
        }

@@ -273,19 +271,13 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
        if (ret <= 0) {
                dev_dbg(cpu_dev, "OPP table is not ready, deferring probe\n");
                ret = -EPROBE_DEFER;
-               goto out_free_opp;
-       }
-
-       priv = kzalloc_obj(*priv);
-       if (!priv) {
-               ret = -ENOMEM;
-               goto out_free_opp;
+               goto out_free_table;
        }

        ret = dev_pm_opp_init_cpufreq_table(cpu_dev, &freq_table);
        if (ret) {
                dev_err(cpu_dev, "failed to init cpufreq table: %d\n", ret);
-               goto out_free_priv;
+               goto out_free_table;
        }

        /* Get OPP levels (p-state indexes) and stash them in driver_data */
@@ -320,12 +312,12 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)

 out_free_cpufreq_table:
        dev_pm_opp_free_cpufreq_table(cpu_dev, &freq_table);
-out_free_priv:
-       kfree(priv);
-out_free_opp:
-       dev_pm_opp_remove_all_dynamic(cpu_dev);
+out_free_table:
+       dev_pm_opp_of_cpumask_remove_table(policy->cpus);
 out_iounmap:
        iounmap(reg_base);
+out_free_priv:
+       kfree(priv);
        return ret;
 }

@@ -334,7 +326,7 @@ static void apple_soc_cpufreq_exit(struct cpufreq_policy *policy)
        struct apple_cpu_priv *priv = policy->driver_data;

        dev_pm_opp_free_cpufreq_table(priv->cpu_dev, &policy->freq_table);
-       dev_pm_opp_remove_all_dynamic(priv->cpu_dev);
+       dev_pm_opp_of_cpumask_remove_table(policy->cpus);
        iounmap(priv->reg_base);
        kfree(priv);
 }

-- 
viresh
