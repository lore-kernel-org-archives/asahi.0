Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F69B6FAC
	for <asahi@lists.linux.dev>; Thu,  3 Nov 2022 11:04:40 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id q1so1326822pgl.11
        for <asahi@lists.linux.dev>; Thu, 03 Nov 2022 04:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DiXjM4iMvd43WrMIxSpRyTAtrsP97x/VxFMbhkANt6w=;
        b=qiEjYezP0qOxICceOLv9V1EqtoBAf2owOkVNHlplVSMCgKx8KquyKvc36mvWqMKm3W
         5I0TSDjWWgnvxNGPrkG8iFkObUQ5rxeAuG+Xe2JXtZ0xQ4cCXyFNp72BDfwOMUtBP2LM
         bqTdxWuBK9GI4ju9i17L+B3i5RJ45eDAq/KINshzib/YUHQ56UrztrK+oPrhLbAQw1K9
         e4sAkOcGB7fZ7P/qBzriTz7ttPyuTO0iHx+C9P8o9l4Dk8LbEJRY73TPwzd4IBkrLJbl
         fN025GYddMZNoW1kb6pW5iGiMfoGhBuVpexU53P+mMJmYh8N9+C4su7qmoMGIKz4M988
         OTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiXjM4iMvd43WrMIxSpRyTAtrsP97x/VxFMbhkANt6w=;
        b=ZDwb0O3gLSg3KYoJrY2bF/TdNHrywOtTNCbDqrkTuKpF281oKPA5H0yMLSOX5Jp5yG
         JuhfohCnDuFqwKv0w8w36gF74yieHJrDwRoBqmkFEli4cwV46JUnJbli3YQRAiGqP5gq
         IhbLBB4aq6O5ZYaKIKe3VuMh+wJPcuqourjtShO/Ou+xEeWKWN4Z9Qq006zM20scD1Fr
         SyKho3AZaX5XozlX640fAoHd1FZGPNJzpHCt2Hx6X21gxQBeKOp0ohvwJqxuqaOhZ5v7
         MlY382ONXgnjKVz3Vb9Zz0WlDyw3SPwYj6ACOWq3WIC94r/e42f67+lA+zXkYJ0cnebv
         7p2g==
X-Gm-Message-State: ACrzQf05mvGYTwDdvdJBW+mI4GIfPBtkcgQ7KVd5brHj4UPwKeuy+cLw
	GzBhdEDVn9dziNv7IZeOLJFBjg==
X-Google-Smtp-Source: AMsMyM5+1lQ/y2nh9vFIrWD5JV4qg6JGTWNsSck0DDXg/GgvtF3S3J/dJ9NntHd213XBDRjmAnCB9A==
X-Received: by 2002:a63:5d0b:0:b0:464:bb2b:9b0e with SMTP id r11-20020a635d0b000000b00464bb2b9b0emr25126297pgb.583.1667473479658;
        Thu, 03 Nov 2022 04:04:39 -0700 (PDT)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id d6-20020a170903230600b00186ac812ab0sm399146plh.83.2022.11.03.04.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 04:04:38 -0700 (PDT)
Date: Thu, 3 Nov 2022 16:34:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, nm@ti.com, sboyd@kernel.org,
	vireshk@kernel.org
Subject: Re: [PATCH v2] OPP: decouple dt properties in opp_parse_supplies()
Message-ID: <20221103110435.5egvoqwppczmij3t@vireshk-i7>
References: <20221102090228.odyt7ykdkcbdx4lw@vireshk-i7>
 <20221102102011.11623-1-jcalligeros99@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102102011.11623-1-jcalligeros99@gmail.com>

On 02-11-22, 20:20, James Calligeros wrote:
> On Apple SoCs, all the regulators are controlled transparently
> by the hardware/firmware. The CPUfreq driver requests a pstate as
> described in the OPP table by setting some bits in some registers, and
> the platform handles everything else.
> 
> Not only is there no use for the voltage and current information from
> the kernel's perspective since there's nothing to control, we don't
> even really have a way to reliably model their behaviour.
> 
> What we can do, however, is use energy counter registers in the core
> clusters to determine energy consumption at a given pstate and register
> that with the OPP core using the opp-microwatt property. Given that its
> stated purpose is to enable such behaviour, requiring it to be coupled
> to opp-microvolt is a major design deficiency.

I wasn't asking this. I was rather asking if some code for your
platform calls dev_pm_opp_set_regulators(). I assume No based on what
you provided.

> >I won't call it a fix, we are trying to use this information in a
> >different way here, that's all.
> 
> My interpretation of the commit message for 32bf8bc9a077 is that this
> is the way in which the property was intended to be used, and that it not
> working like this is a bug. Quoting the commit message, "Some of the platforms
> don't expose voltage information, thus it's not possible to use EM
> registration using DT. This patch aims to fix it." 
> 
> There is probably a bigger discussion to be had on whether or not parsing
> opp-microwatt for the purpose of EM registration should be entangled in
> opp_parse_supplies() at all, but that's by the by.

I get it. I will still skip the Fixes tag for now as that may make
people backport this to older kernels, which we may not want as there
are no broken users currently in mainline.

> I noticed no adverse effects from not having opp-microvolt in my testing of
> this patch, possibly because the data is not used to actually puppeteer any
> supplies. This goes back to the greater discussion, though. If we're going
> to use opp_parse_supplies() to do EM registration stuff then having the
> check for a valid representation of an actual VRM should probably happen
> elsewhere, where a valid VRM is actually a hard requirement of the code being
> run.

I figured out that you had to make a lot of unrelated changes for this
simple change, just because of the layout of the routine.

I have included your patch in my series now, cc'd you. Please give
that a try and see if it works or not. Thanks.

I have kept your Authorship and Signed-off, hope that is fine.

-- 
viresh
