Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDD4259C
	for <asahi@lists.linux.dev>; Thu, 10 Apr 2025 04:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744259869; cv=none; b=hHWCOhg/IktQDs0HrZ6JKgvFXpQeYH70pJ4Rh0V3YOxyax+PvBtJMIXQxHPL8ErtZg6Pf3XqHVIZWRhiVhRJWlzWeWxuv9obyALQ7C8U1n1ZcDJy+v7WmUfWd/Jm89Z1ZZ5aAZJnZrnj9sgA0OKYJ7KKt1QPco+8Bug8kF7rkNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744259869; c=relaxed/simple;
	bh=1Xix/mO6aE19SIT5lyF30wlU6UXfyC7ZaeE7p6sIKzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UR7JAdaO6lBktMne5OxpvZPFSrlv2LnJRsvudv82EWzG42Vw04HfkKHXbgxhZyXLMbNagVZXnXMEVmPyaIxUCjlkVxZXBASJg+j6N/l1XLYopQkatCqwE80aI+TDZ8CzG1c7mKV3S87WwNRiUjAa1E2iI2zxq735Y0sPxpcDY1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gc+b5gXK; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gc+b5gXK"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-730517040a9so391781b3a.0
        for <asahi@lists.linux.dev>; Wed, 09 Apr 2025 21:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744259866; x=1744864666; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dKq9kzMYsicKdtkGA5MBDLw3TZIwxRLfS0ALUoxDg9c=;
        b=Gc+b5gXK+NWBfrJLN7cpdbKrYscZHfMcb14tmKuZcvlZ5XLhrHEDf6y2xemXfF3Fsd
         NrhrrLnGRP6exDCcJKgPUvrg1Mu9Sd/vw2vL0Po+SAUEjgT0i+mGAkzpzRgpPRJOTlnE
         ueh4peGxlhGFaB/rGyO4UVC1t299SzL+u9iC38fxkYDKCfzIzXBC4WKg5NdTgqENdNZW
         RwqASveLHOynASmae1AShWVeNh43NSQpTRsvLQdGo+SxXgoNM+VqHLn1r4L6tpLS+Dk4
         xN9b/0TZ9gEcpzHiYar30F2jWpVjpZ2T7oQ7A9daQiW9RuonD6o+ogCWHoujbEAEQGIY
         aOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744259866; x=1744864666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKq9kzMYsicKdtkGA5MBDLw3TZIwxRLfS0ALUoxDg9c=;
        b=QzGNCZNUwPHBxPA2SVFwXZnE6sX6CTaG0V/Rt0uwsKl91Mht3bng6linZ1i56KkdYi
         BOck8kRHI2Mk/pyIPS3nLeiJZM9rBuXUWHtlP9bS0hIQ+oebaY1V7FGag2IufcusOGjU
         XT4RIdW9+5OkOwJ961JnC06aP7ac0UNZjuyHOOKN/skZsUDITCLmvzmrtuqXY1hvzidJ
         uA7P6ueyzk0ODhT4RvkRsZYm33XPjgNeQDKfkVLMpFTENuyLYiAdZtXOV7FRRcWUyHf7
         aUNEMTXvl9JSfOiJp2LiI5+r6xTV5uRCwF10dwHrE7I+MJknEcKROs/bdoxnrys6+Snn
         NC7w==
X-Forwarded-Encrypted: i=1; AJvYcCVfPSCl5OKvVdRYulZ0+OZLNkbz5iXYPwb2R1rRwCySXFJlVvoimHL0mFbTnc3ZV4vx24lLlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCOJP5cHYkXKgpgFR+yriar4+Dbl6WO9N+jasV0BB4cUoTNFWh
	WMtdELmknRjodejqDKL5ltwWzLVPSXLBbfVtdbrHZSy4BgPK9hHt6Rlm0Q5io2s=
X-Gm-Gg: ASbGncvdKfUsgVclCKs8lQ0+1hDR6YJMcXqoWXtGMhr9PcjcPh/E87XMA7IyNIABg/8
	cOywPlAHDeCwJc4opVHic5mFRNLJUhgOrnma1Osg+aqcBkKMb2zMsO9wBMixLpB5OzNoXbw2/PC
	mK2aRfDv9ltXabZzfvdzYJmm4ks9HLdVFleZsY6BvBiBJcEKQZbOoEo6d5ZMBVU/zzb6aqCilXW
	MvY8eGqxdFimHeTk8Yq8YNzgefWuHpQj/5/0eA4C836+goDTyinvpHQo2wd6FruwEK3VikJqOqe
	/WnrCvhm7RiIpPEggpjcSAOy8B1JifEE4tjcJvcPvQ==
X-Google-Smtp-Source: AGHT+IE5WApQf0idcPfilUjF6fBUp39jssoyHNZPfC/qpfeRdr8GHZIk0YeghJmMBYI3ABubgqhHhA==
X-Received: by 2002:a05:6a20:d528:b0:1f5:9069:e563 with SMTP id adf61e73a8af0-201694cef6fmr2822217637.21.1744259866440;
        Wed, 09 Apr 2025 21:37:46 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e3842dsm2345076b3a.108.2025.04.09.21.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 21:37:45 -0700 (PDT)
Date: Thu, 10 Apr 2025 10:07:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: sven@svenpeter.dev, j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev,
	rafael@kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: apple-soc: Fix null-ptr-deref in
 apple_soc_cpufreq_get_rate()
Message-ID: <20250410043743.rxwixe7slr342d56@vireshk-i7>
References: <20250409124813.47193-1-bsdhenrymartin@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409124813.47193-1-bsdhenrymartin@gmail.com>

On 09-04-25, 20:48, Henry Martin wrote:
> cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
> in the policy->cpus mask. apple_soc_cpufreq_get_rate() does not check
> for this case, which results in a NULL pointer dereference.
> 
> Fixes: 6286bbb40576 ("cpufreq: apple-soc: Add new driver to control Apple SoC CPU P-states")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
> V1 -> V2: Use `if (unlikely(!policy))` instead of `if (!policy)`
> 
>  drivers/cpufreq/apple-soc-cpufreq.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Applied. Thanks.

-- 
viresh
