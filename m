Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B241D7ED
	for <asahi@lists.linux.dev>; Wed,  2 Nov 2022 10:21:06 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id y203so1863210pfb.4
        for <asahi@lists.linux.dev>; Wed, 02 Nov 2022 03:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+v+Uk4ph8G3ivevMkDD1+/l5JO6IeLjWfLLSRXlGKg=;
        b=GVZOwlOBgXY+2rToRwZ6Q4ktnqTnUjC1UK4TrgdxvWLKFpuYvjriu5/Q49S7RJgJBz
         G0dYOCm1P4oLO42bh/MEIxiQH2wF3DNQGVYsaa20gnhNCmKYRxKe/fhSKVD87ve7g10g
         iDawmziHNrZ5+07pjlmw84SjAkFXaGj0dQFvZincZNE7IPbzkem201AUYnmNQyRAC6yI
         9FMDDgE0vlOKefKr+WYYwWYTLgdDWEh8reaaq2Gj6znuZU8YzBg+NwpcWHH3P3LlT/3d
         YxbzTJ5+EnLzF32Le8sc67JbK+ckjX4C1oDBWzCY0miH0uphW+8pQB6cGmYGWXcTb6lG
         7pHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+v+Uk4ph8G3ivevMkDD1+/l5JO6IeLjWfLLSRXlGKg=;
        b=UCnSbPxv3gpr6+81TvW9dRjOyhZj97qD9sD/c7JSRrUS6GS8xkXtHjMs4k/ni6y9o/
         vYf82iUdkG4p2y7tBdTsBvtAA7asmDXMpNR/i3wIRNnSzGE29En0oxuOgpyuVsqJBD7H
         cfWqtL68ss4g8/YBXFpeM4xgxoyMZdv+YG3s1heMZiMT9CA7EDPv+84pX/kSzV2T+Hod
         ekxLSRkcWqjBrkk6dR/TM8xJPN2rJIzUHSK6nYf7OjEuXt13RHZCJD5goPSlCTNHkaeE
         Vxihh7HJa42HE8BU4hUllwZghzSOcx2j77k6/a7eFMcDMoXZJswL4AEvUetw4KIyQGsP
         HsMQ==
X-Gm-Message-State: ACrzQf3IDWs9GSJehpZp9gesHdG8xd8Ro9cXuhDg15N5QBziYqoGo4Sh
	wBI6kM3X/LWTYmVa0wc7scs=
X-Google-Smtp-Source: AMsMyM4LOhJz5rxgtFjV6yVXQUawGjAc8IinLj4FnHJo3GNB+7LqwgTK52RVRShmpwXtpX0XTr2vdw==
X-Received: by 2002:a63:ce54:0:b0:46a:e2a9:c7f6 with SMTP id r20-20020a63ce54000000b0046ae2a9c7f6mr20856483pgi.264.1667384466034;
        Wed, 02 Nov 2022 03:21:06 -0700 (PDT)
Received: from localhost.localdomain (2403-580a-80ed--90b3-8553.ip6.aussiebb.net. [2403:580a:80ed::90b3:8553])
        by smtp.gmail.com with ESMTPSA id d12-20020a170902654c00b00176acd80f69sm7919680pln.102.2022.11.02.03.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 03:21:05 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: viresh.kumar@linaro.org
Cc: asahi@lists.linux.dev,
	jcalligeros99@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	nm@ti.com,
	sboyd@kernel.org,
	vireshk@kernel.org
Subject: Re: [PATCH v2] OPP: decouple dt properties in opp_parse_supplies()
Date: Wed,  2 Nov 2022 20:20:13 +1000
Message-Id: <20221102102011.11623-1-jcalligeros99@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102090228.odyt7ykdkcbdx4lw@vireshk-i7>
References: <20221102090228.odyt7ykdkcbdx4lw@vireshk-i7>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>> The opp-microwatt property was added with the intention of providing
>> platforms a way to specify a precise value for the power consumption
>> of a device at a given OPP to enable better energy-aware scheduling
>> decisions by informing the kernel of the total static and dynamic
>> power of a device at a given OPP, removing the reliance on the EM
>> subsystem's often flawed estimations. This property is parsed by
>> opp_parse_supplies(), which creates a hard dependency on the
>> opp-microvolt property.
>> 
>> Some platforms, such as Apple Silicon, do not describe their devices'
>> voltage regulators in the DT as they cannot be controlled by the kernel
>> and/or rely on opaque firmware algorithms to control their voltage and
>> current characteristics at runtime. We can, however, experimentally
>> determine the power consumption of a given device at a given OPP, taking
>> advantage of opp-microwatt to provide EAS on such devices as was initially
>> intended.

>Do you supply a regulator to the OPP core for your platform ?

On Apple SoCs, all the regulators are controlled transparently
by the hardware/firmware. The CPUfreq driver requests a pstate as
described in the OPP table by setting some bits in some registers, and
the platform handles everything else.

Not only is there no use for the voltage and current information from
the kernel's perspective since there's nothing to control, we don't
even really have a way to reliably model their behaviour.

What we can do, however, is use energy counter registers in the core
clusters to determine energy consumption at a given pstate and register
that with the OPP core using the opp-microwatt property. Given that its
stated purpose is to enable such behaviour, requiring it to be coupled
to opp-microvolt is a major design deficiency.

>> Fixes: 4f9a7a1dc2a2 ("OPP: Add "opp-microwatt" supporting code")

>I won't call it a fix, we are trying to use this information in a
>different way here, that's all.

My interpretation of the commit message for 32bf8bc9a077 is that this
is the way in which the property was intended to be used, and that it not
working like this is a bug. Quoting the commit message, "Some of the platforms
don't expose voltage information, thus it's not possible to use EM
registration using DT. This patch aims to fix it." 

There is probably a bigger discussion to be had on whether or not parsing
opp-microwatt for the purpose of EM registration should be entangled in
opp_parse_supplies() at all, but that's by the by.

>If there is a regulator, then we must have microvolt property.
>amps/watts are optional.

I noticed no adverse effects from not having opp-microvolt in my testing of
this patch, possibly because the data is not used to actually puppeteer any
supplies. This goes back to the greater discussion, though. If we're going
to use opp_parse_supplies() to do EM registration stuff then having the
check for a valid representation of an actual VRM should probably happen
elsewhere, where a valid VRM is actually a hard requirement of the code being
run.

>> -			return -EINVAL;
>> -		}
>>  	}
>>  
>> -	if (unlikely(supplies == -1)) {
>> -		/* Initialize regulator_count */
>> -		supplies = opp_table->regulator_count = 1;
>> -	} else if (unlikely(!supplies)) {
>> -		dev_err(dev, "%s: opp-microvolt wasn't expected\n", __func__);
>> -		return -EINVAL;
>> +	if (prop_mv) {
>> +		vcount = of_property_count_u32_elems(opp->np, name);
>> +		if (unlikely(supplies == -1))
>> +			supplies = opp_table->regulator_count = vcount;

>This is wrong. There can be one or three entries per regulator here.
>Target or min/max/target. If the supplies value is -1, we can only
>support one regulator, i.e. one or three entries total.

Ack.

- James

