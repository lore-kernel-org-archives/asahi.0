Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BEA36E49B
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 20:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783111971; cv=none; b=kmn0ELCmIrJqYKEzSdXvDH9RJDU76y9DVkzC5poKddiUvsOETmw1Xja0MijDcIXP8COB1DzvHMpQNILunQFZA9PwM8HhFDSMfvf+SZEfo9MOWA6p/un9mW1ICVAHXl1vMecqGCROTlYfGmxLrHAI1UrejBDYx/I9oNO9Cmq8SkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783111971; c=relaxed/simple;
	bh=ve2iCvc48gIh6oKHzVFM5RBDggJo0jkLEQ4dRPdJUk8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TSv2u1QUcOfRc57ReznaoWHOjn+sf/UJI92ngEtOBXSDHvxEP9QdTOrlbva48/+IkcmiSjymY/EwBVSaRRKeuv3VLCr2tqEFj8mT4jeCft+WU+HliKgAKgsE5cHg3J/LIxoMXSO4kadeFJEpbP1k9J2dUF4ElNNSmkdFwzS39bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oCCgzAeD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oCCgzAeD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so10096305e9.0
        for <asahi@lists.linux.dev>; Fri, 03 Jul 2026 13:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783111966; x=1783716766; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iHBixXF0joeUv/ZwlLB2ZHCvM2TQE0OYai8QhyfV/nQ=;
        b=oCCgzAeDaaRopw4Jmef2KjpyGKECNr5pnlaWKgyoSAKnXsn4k+bbn/k4Lu77yV+p1Y
         nJGk1qlNHtTSGJSRvbA+35qMi/6soYsTWMebl0LaJopMyr7xIRzcJa2YpzydiOWEDi+u
         +9m1PC1pwJ6OJPY3O5d8HbMz1PB35CsGAY8PZbgh5KBoNWYD5lzMB4TujRahP2s6i6nE
         wwjgXhjRhB+kcnblefjmV89cAAZgk8EbEtGpzkAInC/EoHcLOPBY5+71X/9izXH1H+FG
         MnMXsn62+hvcfmUdPgS8tpFNJZn6K6f0rZ2iIqwCWGsBoaJjBqSkYtWlE1bTS/YARU25
         Mcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783111966; x=1783716766;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHBixXF0joeUv/ZwlLB2ZHCvM2TQE0OYai8QhyfV/nQ=;
        b=W/EqY3G/8yq9sEHoLdsxTCq0t0zHKqq6933y+SR0l2vanFaW4h7tVJ+4YWobzRa1fo
         mpQlqzNT1Nz0qUCsTxEPXs3SqCB7Uf98UZJAGxwOabmv9DjYIGpovHRi7HbSsqpc8MRc
         v0JGR8vp0TLS4CiA1p6+DLttxL4RLRXAvTWJjDG2RdEEuudtmpUz/gXZvTSDDtHnAhRl
         6LrKV8PAvjj8QhlQRo6IvlVQ7uRvK0C+MPbACsUgo+bUCNakvEkk1tAT51ho6dToZyCc
         qkLrL8b+a0GmdtZTN+/ejuxg+YGPJeKDDp/uFQu1vnxnZcHQvzsvB+6+VpjWd+nV9w1y
         f7LQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wvFo26F/Ki83tpOhX+omrfj2F+f+wfWDbLkR5sf6hrYLx8WXO8GYiAYNr9k493jr7ubX3LA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyccDJ0X/QxZqnxo7iwbldeB/zflE050tWzdqw5XhC5/ozZZpam
	ES6FeX8VHawsIuG5pcMkxoyz1LqgNwsjoobkSAn/f4hfe5yEUeCl2dVE
X-Gm-Gg: AfdE7cnL8reskKFdeydsjc7icxpC/NnaI2MoSLzl8Y5VmMC2HMfp4ew9y5zbqtT9z2f
	7XE6pR2hLAzwECjuhjXFWuhJJHnKlj6cMPIp5qyzEZvVM7t/u1S4EJ4yonNXwMjjOSAlsBmDjOC
	TXeVor4+oGxgp3XpfCZlFeiJiGBAy4GSBbKA5AT5u/rbOvdazR2YaEeouP1VLjRTGNzhRK0CbVj
	aOryi/+niFuv8cJjSYhPq1NNqRVFMHPrrVudO+ffrel/JyzoqR8ILV5G+OG5Fg87cE1dkxLlj/m
	ybWDgOhwds5G2YeZeVEmj8JCmxH5cJfSs9/mM92C2STBc/zdO/XjpKlXnKTfTI8x0He+DXNBpkH
	LYVbwPDE0MPzIVL+A1dDaGBiwH/BnX6hWX0tVEHDWwmEDDtMFZh1uEtEJZIJReQy0kUxx5QoxY2
	th/tD6bjwiq33EJqXfHRE5k5EVdsUtH0aA36DtHFFBUNLZ2SabD5P6nJUS
X-Received: by 2002:a05:600c:4e13:b0:493:b729:3a9 with SMTP id 5b1f17b1804b1-493d11f577amr8863935e9.27.1783111965965;
        Fri, 03 Jul 2026 13:52:45 -0700 (PDT)
Received: from pumpkin (host-92-21-50-228.as13285.net. [92.21.50.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef183e7sm259988995e9.2.2026.07.03.13.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:52:45 -0700 (PDT)
Date: Fri, 3 Jul 2026 21:52:44 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa
 <neal@gompa.dev>, "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: apple-soc: Calculate frequency as a 64-bit
 value
Message-ID: <20260703215244.437ec9ac@pumpkin>
In-Reply-To: <20260703-cpufreq-64-v1-1-c406c705319a@chaosmail.tech>
References: <20260703-cpufreq-64-v1-1-c406c705319a@chaosmail.tech>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 03 Jul 2026 20:52:48 +0200
Sasha Finkelstein <k@chaosmail.tech> wrote:

> The current frequency calculation is done in 32 bit, causing problems
> if run on a future SoC that can boost higher than 4.2GHz.

If it matters you need to fix it for 32bit builds as well.
It is pretty much really wrong to use 'unsigned long' for frequencies.
IMHO the should either be 32bit or 64bit.

	David

> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
> index 638e5bf72185..6a0f1d36578f 100644
> --- a/drivers/cpufreq/apple-soc-cpufreq.c
> +++ b/drivers/cpufreq/apple-soc-cpufreq.c
> @@ -288,7 +288,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
>  
>  	/* Get OPP levels (p-state indexes) and stash them in driver_data */
>  	for (i = 0; freq_table[i].frequency != CPUFREQ_TABLE_END; i++) {
> -		unsigned long rate = freq_table[i].frequency * 1000 + 999;
> +		unsigned long rate = freq_table[i].frequency * 1000UL + 999UL;
>  		struct dev_pm_opp *opp = dev_pm_opp_find_freq_floor(cpu_dev, &rate);
>  
>  		if (IS_ERR(opp)) {
> 
> ---
> base-commit: 4a50a141f05a8d1737661b19ee22ff8455b94409
> change-id: 20260703-cpufreq-64-2a23d7261e09
> 
> Best regards,
> --  
> Sasha Finkelstein <k@chaosmail.tech>
> 
> 

