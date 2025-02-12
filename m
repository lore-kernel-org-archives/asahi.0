Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5A2271816
	for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 01:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739324806; cv=none; b=a0bSzQvJ1WQFVFodM+IEC/OeFYGsA+8haGrIXPBlrpA3QfM+ClUpkTNhtwDnrgy20dgiMGTy1HhR+INdoKFA0rHYX7tV0D6GxQ98vsd/LVvGw8g+A2LH12x0Xe4puVeQYsYXPNf/PNhZbvTil10+Swl+nnc2YtLHTUmh1U15Y8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739324806; c=relaxed/simple;
	bh=PSCzs3ngD+C1yXihEL4cFezGLCaJyzWjlhrxKXNCgrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kJeRNDDPIPCAuMhfc2ltK4F8TttAsWiIuQItXIJTFRo4qvuc8FVPW66mxsuvCtUgS+b8R1gH9vzOmoCxNR7mqem6WuldyRzsKCteE4haOezfaYllvcpTx3lB+WE6x56B+XiMAMHitRxrPrWKhoF2C0dpPFzg4sZvpZniAKBkcYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvJKDQvX; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvJKDQvX"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21f44e7eae4so105384925ad.2
        for <asahi@lists.linux.dev>; Tue, 11 Feb 2025 17:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739324803; x=1739929603; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a1PecfJ/ulEmOVAcJ2BrU2idsARRJ75dqEtuR45WJos=;
        b=DvJKDQvXuz7/1BOMT2TAHmnOo/lP6l2DDeKboVT1WqaXlL8Z57mWeyBaQqb3Jd4CQz
         Cn9BrqsoKav6vNI9Xg9aaq8T7cmq93koQsokhaSrtjflaxkqrgg5nJsfU3yByD/QAlIL
         IjpWlZIWh49IHWQRHrye3Ijqevk473DSpTuv5uQGYkJyxtHX4eObJnHfOQDtO21L5bGq
         qdh3l3F5VwV0fyxMPOLY9FGKHHDuc5DDdfgyUY65pPPGahb1Bus5AvHasPjZewP5fta0
         XFJl0bNbs9pSTNGTb4QCbMTn9BLZVOYYHIUzwGBmoN9PWrL5u2Z/zuClwLkwuGUh2x+I
         d9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739324803; x=1739929603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a1PecfJ/ulEmOVAcJ2BrU2idsARRJ75dqEtuR45WJos=;
        b=hDOrsKdx4if8rSM+IQyZVM0bklpAl01hdeiKP3rxXMbARYIa5W0lzG642/Q5o8/7AM
         l+p1MB3LfzQA/pdz3emvylOAjF7jRjYcf1H5qW9OKtj8ZZWnXGfqNkqVYpc6iTHmVSwx
         y0MZvCf3iobWi84e6ifJ8wT1sOiheEGkNYB/TElfxNyebcsYSEPPbVrSK9u+NysPD7vr
         63CLCSXR2rjuF90BcIZloVYUgzzJElp9sk5AOuK7dy/3juveC0y26Zx8YQPaeTZspTox
         LWwZ5MDjzA8QLvzHfixMnZ4KnmOHBTd0UDW/bLh71Do8ad7al3RmttvAXeq4foiZPl3H
         zG2g==
X-Forwarded-Encrypted: i=1; AJvYcCXqze1cmF9e0aa1LTE8j29jMf63/WY/xUEDSlVDNsi+TY/cNo3n4qG/fh3Db8BCLcUTKQv0lg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5xRcsZ2whJTlTY3hkP9Rh7+XYJdK9Jceg1KMZUx4XmEvt/pNJ
	4T/nJzBif4LX8XpqRbkkVSc3k2hRBYNbQdbmTSqVTAg8oxMkOLg+
X-Gm-Gg: ASbGncvTl01J7fzk2bduK+7WGhUrPYrVzuV/CsfFoavsSCvUblkUjZGaal08jiTFxs2
	9l4pFyMlLZQ+XBugNjYgx0AeaLbzxJjo3x0/Mqtyh67uYC/Yko+wMPUBnqE8o/GVIcRIo8wDgk6
	HCkmrOKYoxT2EfdJ27br1aBblaLSC61L2zq8FN5SU7YPJM9nWohpY6I41a/Vm2mHGXoyGIVYmcX
	NRxpth0pSEJXm+hnWIWXzA82VBKHhytJZyFhn2vtPekWY5H9bYWmfOwCQJHd+Ui+Cb4rPY1V8tZ
	3mS2ecDe26sbpE6SNG4ecfWRaGisuUR+0Rwx7Obpm3IPxy7VCtY=
X-Google-Smtp-Source: AGHT+IHynglCW7bmaS/rFXo/7iC4aLmIduuaHZeoNU0TbMyLvmCKS9G7NEptuYzgov+wProVrfEplQ==
X-Received: by 2002:a17:903:234e:b0:216:282d:c69b with SMTP id d9443c01a7336-220bbca3a8dmr19893075ad.50.1739324802807;
        Tue, 11 Feb 2025 17:46:42 -0800 (PST)
Received: from [10.89.236.32] (wf126-032.ust.hk. [175.159.126.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687bde1sm102872645ad.195.2025.02.11.17.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 17:46:42 -0800 (PST)
Message-ID: <23db2d80-cfc4-4c15-a4fe-11e677185344@gmail.com>
Date: Wed, 12 Feb 2025 09:46:38 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] drivers/perf: apple_m1: Support per-implementation
 event tables
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com>
 <20250212-apple-cpmu-v1-2-f8c7f2ac1743@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250212-apple-cpmu-v1-2-f8c7f2ac1743@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Nick Chan 於 2025/2/12 凌晨12:07 寫道:
> Use per-implementation event tables to allow supporting implementations
> with a different list of events and event affinities.
>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  drivers/perf/apple_m1_cpu_pmu.c | 65 +++++++++++++++++++++++++----------------
>  1 file changed, 40 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
> index 06fd317529fcbab0f1485228efe8470be565407c..1bf7ce5c09846c699d66bdfcca129f418a9dad9e 100644
> --- a/drivers/perf/apple_m1_cpu_pmu.c
> +++ b/drivers/perf/apple_m1_cpu_pmu.c
[...]
>  static void m1_pmu_reset(void *info)
> @@ -572,25 +588,16 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
>  	return 0;
>  }
>  
> -static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
> +static int apple_pmu_init_common(struct arm_pmu *cpu_pmu, u32 flags)
>  {
>  	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
>  	cpu_pmu->enable		  = m1_pmu_enable_event;
>  	cpu_pmu->disable	  = m1_pmu_disable_event;
>  	cpu_pmu->read_counter	  = m1_pmu_read_counter;
>  	cpu_pmu->write_counter	  = m1_pmu_write_counter;
> -	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
>  	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
>  	cpu_pmu->start		  = m1_pmu_start;
>  	cpu_pmu->stop		  = m1_pmu_stop;
> -
> -	if (flags & ARMPMU_EVT_47BIT)
> -		cpu_pmu->map_event = m1_pmu_map_event;
> -	else if (flags & ARMPMU_EVT_63BIT)
> -		cpu_pmu->map_event = m2_pmu_map_event;
> -	else
> -		return WARN_ON(-EINVAL);
> -
>  	cpu_pmu->reset		  = m1_pmu_reset;
>  	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;

[...]

The flags parameter is no longer used, so I will send a v2 with the parameter dropped.

Nick Chan

