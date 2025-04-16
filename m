Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8263D22D4E2
	for <asahi@lists.linux.dev>; Wed, 16 Apr 2025 07:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788866; cv=none; b=U7T7T9x0L4xNZG3H5IzrG6Kld+HapKbXWRo1LSiJG7VFfAIaViI+Up6IH/hPbYAZrgStCldCgR/HdWa6sYE9ODXuh3wx8Ncs+z5ptQwAgTyBy7ZgWFM37GcOJ8ky8LkLX75deoMbw15yAQC8lQvMWiKuMI6ZgEvM78kSHlTeQd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788866; c=relaxed/simple;
	bh=Osz8UwWeE7SoEkx8hhEOY9AIQrzeHRMkeYvC/KMmssg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NdH4bANeO5VLroR4/z0zbbJd5Dvxbvc6UZGT2eAFlGKoVhwn9m0QWPRrQsiNw6fGjyNTAo4ZN5h5B6QDWWYM3qV2ZBSpRWAE3SnRFZ2OGVhIRqzsntTsITJrVWNotdWTO0gjIHLI/2iV0zn9p5cb8gIrGuyz8aA3DpCjfeSuE68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NgNMRcuW; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NgNMRcuW"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-73972a54919so5454448b3a.3
        for <asahi@lists.linux.dev>; Wed, 16 Apr 2025 00:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744788864; x=1745393664; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9OojZ/Set6ofgNmoLSDBYOLQFH7SYSkSj18BSfmQvXU=;
        b=NgNMRcuWm1OUZ+mc7iySVtH81KqL3OUv1dLNlUICqFspANiKGliqF1BqiCGd9Vyv5V
         y7YtzjXiZ/3S9gIhcaIA0nHph6QoaJS9Evzf870qlvGHlgWiDpSF+QeFQufEjD3PNvZM
         +tmIzxHdsXrLSNIBf+Xy94PmfKf0ZSwGuvsM/1JZRKq+fRz7hNqEOlJDP1sYMm0kGNRN
         26/jXDptwLzGc9hqx1RjlbTI3Y8kyoM2YnOGmTXl4QhfPgWVxNBw96DR/5YJFU5wjW/0
         dNVAWBQspxYFvW2sjgQ8EXoeqgJlHnKG6eXGwrhtPFF2qf1hnIok++lOMg7SRo434BV7
         NCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788864; x=1745393664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OojZ/Set6ofgNmoLSDBYOLQFH7SYSkSj18BSfmQvXU=;
        b=GzGmnf5Ax+aOAZV5GYfZku6NmpT+L1aquVR4midSKdcf66E5916sSOMPTklfYCoAY3
         IjIYx/Whn+lAew9OZZbKhfbqnYfJG1n+sEK/lNQ22Nyca9ITZK1EpsMLNxexJZcaUKUB
         fAv7/Q66axLBIyfqj/r49Zz7XW7n+s2E5W7tk+DBiP+eOLWNxlEfu3kpRS9tBypTSIyq
         TsmicfcwtUtVOSJ84dUCmQUCWTOTBK6ydy0ZU28AY3SekV7bswJCVlGOtTH5tDdTrPTy
         jMWgfHV6imyisZE8rZ+IIbz0Gf4n51HPfaqVIwaiK3YOVrCtQ6U8vkrD/hmECtsFMfgB
         cYew==
X-Forwarded-Encrypted: i=1; AJvYcCX61nEDW++BgvkNR5QVkE55ODQTFimeGXrcrEDpMmXLxZavohjOGEKtadP7SL2BQ22PZx6ynw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxiPEd8Fte8+Q4jcL2slh6M9Oyu+mfnw9nJCBqVvFYApi3uHWKj
	8hSBX2P7n+2vccz2//k+GkUR63zz6458JPUEKw2Ydvb+wIcpjCDHUAg21DQ1AEQ=
X-Gm-Gg: ASbGncv25fPdnn/S7qnujZPK4UXCPN/LXAMuJXrhEGSogxOBJIPJoyJDHmkljyOl2EF
	nU+NILYQkWZJtBUAVdadRuYb4sIL/qPdRLoQzuh0D0Qbc7BjUs9iPS5VluWSbw0Bhomu9QO5ZR5
	fxGF2w2lm/CVHqpSgd5pNJLHZp/p3Zv5I4YTmxisbZlxRdk2TLWhH/SjBm6+o7DEMN4mdrmCL1c
	7ugZvrrAbp20MaiKYjjN8WNDig72J2ldbMRhg64hKdkwnofYoWZP8PDRnuK+/2w4mDwBtweqiAo
	iMVfAzmW5hXjyHrLeo1tbXF5y+8koka6jbY2biiNCg==
X-Google-Smtp-Source: AGHT+IF5gr7KTNmsoqWboKzNZwhfvZjvETmtD0k891OgOb0tDlIqVA7ofglJmZDsPCASVeystx4Ztg==
X-Received: by 2002:a17:90b:520a:b0:2fe:8282:cb9d with SMTP id 98e67ed59e1d1-3086415c684mr1191209a91.28.1744788863789;
        Wed, 16 Apr 2025 00:34:23 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30861212c3esm872339a91.25.2025.04.16.00.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 00:34:23 -0700 (PDT)
Date: Wed, 16 Apr 2025 13:04:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rafael@kernel.org, Marc Zyngier <maz@kernel.org>
Cc: Chenyuan Yang <chenyuan0y@gmail.com>, sven@svenpeter.dev, j@jannau.net,
	alyssa@rosenzweig.io, neal@gompa.dev, marcan@marcan.st,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: apple-soc: Fix possible null pointer dereference
Message-ID: <20250416073420.xrhwnzy22zf6yltm@vireshk-i7>
References: <20250412160518.1824538-1-chenyuan0y@gmail.com>
 <86bjt0l6q4.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bjt0l6q4.wl-maz@kernel.org>

On 13-04-25, 11:02, Marc Zyngier wrote:
> Irrespective of this, it would be good to describe under which
> circumstances this can occur, because I can't see *how* this can
> trigger. The policy is directly provided by the core code and provide
> its association with a cpu, and is never NULL at the point of init.
> 
> And if it can trigger, why only fix this one particular case?
> Dereferences of policy are all over the map, and would be just as
> wrong.
> 
> So while this is not wrong, I don't think this serves any real
> purpose.

I have applied such patches in the past, considering the same as good
practice. But I do understand your inputs.

And so I tried to see if there is actually a way to trigger this.

- Platform with two cpufreq policies (freq domains) with one CPU in
  each of them.
- Boot the kernel, policies will initialize for both the domains.
- Hotplug out CPU1, that will remove the policy as well.
- Call cpufreq_quick_get(1), this will call the ->get() callback for
  CPU1, for which there is no policy available.

But this is the case only for drivers with `setpolicy` callback, this
shouldn't happen on apple-soc.

I am not sure now if we should just apply this patch to be safe, or
leave it as is. The cpufreq core may change in the future and call the
`get` callback for all drivers.

Rafael, what do you suggest ?

-- 
viresh
