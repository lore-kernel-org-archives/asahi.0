Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD0F1C68A
	for <asahi@lists.linux.dev>; Fri, 12 Apr 2024 06:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712901779; cv=none; b=euSQeYk5e6q68nFRO10cQcawJvaHWOhSHEoqFm59R2ywYtq1MXr4nU4DkSyuVsfykAKW+/27v/xgYjXTZ7SoVUmvQazKYkE/oRk/bTaIFdx5ajCQYmMwinCbHow0q+Qy8+utVUuy6apY7tG/H0SuoRvZfplI6Ct4//9+xTjOehs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712901779; c=relaxed/simple;
	bh=ExyxUzpzP2ODisSEoZ3OwuMrbdzXJYtf7V+Wo66ckDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eARMywtEoRsSDOrAAd3HhZtlwqGnhoxvoPzDV9uBsPA+CHud8LezswcOln7iojUGXk07BZ6xeJbHqzn5PZcfYVSuPUFOpue4+jkDPu7JVcNbUGtuH39rdlhldH1pJCXUv4vzRU9d5+cITshy9nNyQl2e79oTrv0bszdAXe/Glfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZsYZlHRw; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZsYZlHRw"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e4f341330fso5767775ad.0
        for <asahi@lists.linux.dev>; Thu, 11 Apr 2024 23:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712901776; x=1713506576; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOC8VAGw4i+hxCTWqMI13CQ+qXiRk+B8ACq5S9OFfwo=;
        b=ZsYZlHRwVcNmhA8dtVYCXoTG//6Q57hoRpyUu2twG8TS/ZUQb1lMUda5wFQpz2+1eV
         HrjsSyj/7QspQfEDIirT5v+HFZ/laJpPfLVa6E1au79iMcsKcQbnvSqAATPKts9G82XE
         tCLUk7oVZN4AMvotEv7FWL4Nr/6hoj3jG9lyuxu5csMlR8fEsO1NZ3E6ycO5/BaqJafF
         MQ3B7nH24Jwj9WVE2KBGQlr4WkUMvvM7ACo4hH8I1Yr8VXvCFVZsnZsHJenbozunA1R5
         BMbzsO/ECR154vT0I9pvLyazzvVgwqxS0Bo/1/nnPknxLa0AGruE14xklsqv6UW3lkQu
         X5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712901776; x=1713506576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOC8VAGw4i+hxCTWqMI13CQ+qXiRk+B8ACq5S9OFfwo=;
        b=YKO0QVTzmRDJB2BU/pPq+91ElR/H/cFy+ae82pLsADqAsoZ/bTjkEyIsLTMVPxxvK0
         vukXN75opg2N5ckaTvLCROk2ueuC7in8+5YLtKhlClptrduYGr/J+f3X6vHTPoo0T0Vn
         MDqRyQI6Ff3LeGdUSKkcHoyPV1aOTeRMITvBkmqEbtbNHjUAiDRlSwO8bxYAO6ekz9l6
         s0iZ/dUjK1bkTLBa8dsaK/GGq6qTSYWU5eOjQesc0X9EOmSTpUVktiisN/ZOHCDiT0UT
         8W6DzLYuGMGTbCEYNcxezNvVXfbSTbVPC8N5GMUjIBdNVoFJkMRrhdEbc31TgPK/2RVy
         eEpA==
X-Forwarded-Encrypted: i=1; AJvYcCW7/n0OhVX0t0uZ2W80micjT/bu+j+jtCvcsPQKrxT9X6wTZ5pLNTnIat5xULpDY+Jcv4gLc8F4DgwJv+d+MnkSSGZIoLQ=
X-Gm-Message-State: AOJu0Yzyzt7tF03cRTIXNfJMQhDxBhcE2u8ZGCkDzwRKJ+Z3JB8cskbS
	GZubx5kIOL62qS1ofQKCiB1p7tOLe1CsnejOIpTBATG/RoE1wfS6YuU8qgHppV8=
X-Google-Smtp-Source: AGHT+IGvWhNQNRl+dOMxKzEQeMoIVBqZynwnZsjtpEm0vi0PMHQYwTtE0HIB6t53qpjTxft80Fvx7A==
X-Received: by 2002:a17:902:b48e:b0:1e3:f2d0:1a4d with SMTP id y14-20020a170902b48e00b001e3f2d01a4dmr1563677plr.45.1712901775863;
        Thu, 11 Apr 2024 23:02:55 -0700 (PDT)
Received: from localhost ([122.172.85.136])
        by smtp.gmail.com with ESMTPSA id u22-20020a1709026e1600b001e2ba8605dfsm603815plk.150.2024.04.11.23.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 23:02:55 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:32:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Lizhe <sensor1010@163.com>
Cc: rafael@kernel.org, ray.huang@amd.com, marcan@marcan.st,
	sven@svenpeter.dev, alyssa@rosenzweig.io, mmayer@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	srinivas.pandruvada@linux.intel.com, lenb@kernel.org,
	khilman@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, sudeep.holla@arm.com,
	cristian.marussi@arm.com, thierry.reding@gmail.com,
	jonathanh@nvidia.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: Covert to exit callback returning void
Message-ID: <20240412060253.5zzc72mkmmz3xr72@vireshk-i7>
References: <20240410132247.3587-1-sensor1010@163.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410132247.3587-1-sensor1010@163.com>

On 10-04-24, 06:22, Lizhe wrote:
> For the exit() callback function returning an int type value.
> this leads many driver authors mistakenly believing that error
> handling can be performed by returning an error code. However.
> the returned value is ignore, and to improve this situation.
> it is proposed to modify the return type of the exit() callback
> function to void
> 
> Signed-off-by: Lizhe <sensor1010@163.com>
> ---
>  drivers/cpufreq/acpi-cpufreq.c         | 4 +---
>  drivers/cpufreq/amd-pstate.c           | 7 ++-----
>  drivers/cpufreq/apple-soc-cpufreq.c    | 4 +---
>  drivers/cpufreq/bmips-cpufreq.c        | 4 +---
>  drivers/cpufreq/cppc_cpufreq.c         | 3 +--
>  drivers/cpufreq/cpufreq-dt.c           | 3 +--
>  drivers/cpufreq/e_powersaver.c         | 3 +--
>  drivers/cpufreq/intel_pstate.c         | 4 +---
>  drivers/cpufreq/mediatek-cpufreq-hw.c  | 4 +---
>  drivers/cpufreq/mediatek-cpufreq.c     | 4 +---
>  drivers/cpufreq/omap-cpufreq.c         | 3 +--
>  drivers/cpufreq/pasemi-cpufreq.c       | 6 ++----
>  drivers/cpufreq/powernow-k6.c          | 3 +--
>  drivers/cpufreq/powernow-k7.c          | 3 +--
>  drivers/cpufreq/powernow-k8.c          | 4 +---
>  drivers/cpufreq/powernv-cpufreq.c      | 4 +---
>  drivers/cpufreq/ppc_cbe_cpufreq.c      | 3 +--
>  drivers/cpufreq/qcom-cpufreq-hw.c      | 4 +---
>  drivers/cpufreq/qoriq-cpufreq.c        | 4 +---
>  drivers/cpufreq/scmi-cpufreq.c         | 4 +---
>  drivers/cpufreq/scpi-cpufreq.c         | 4 +---
>  drivers/cpufreq/sh-cpufreq.c           | 4 +---
>  drivers/cpufreq/sparc-us2e-cpufreq.c   | 3 +--
>  drivers/cpufreq/sparc-us3-cpufreq.c    | 3 +--
>  drivers/cpufreq/speedstep-centrino.c   | 4 +---
>  drivers/cpufreq/tegra194-cpufreq.c     | 4 +---
>  drivers/cpufreq/vexpress-spc-cpufreq.c | 3 +--
>  27 files changed, 29 insertions(+), 74 deletions(-)

I have discarded all emails with following subject line:

"cpufreq: Convert to exit callback returning void".

While you have sent decent patches for removing the empty exit callbacks, the
way you have handled these changes is not correct.

Don't send any patches for now and please wait and understand what's being asked
from you.

This change you are trying to make is okay and sensible, but you can not send
random patches to the list just like that. You are wasting everyone's time here
including yourself.

Now what we expect here is a single commit (with version history), which changes
all the users of the exit() function (each and every cpufreq driver) and
cpufreq.h and cpufreq.c. That change should compile fine and break none of the
platforms compilation.

Please don't send more of these patches unless this is done.

-- 
viresh
