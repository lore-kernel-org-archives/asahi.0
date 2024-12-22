Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4C563B9
	for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 12:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734869136; cv=none; b=MMjEGYEbLietGXwspQfI7IRWnV5sBaVxyKF/B4NAVqQ6IOqB/JH0uv9ey8PxvBrLQ6NcMvWRyfypg5GEZRwJnMOuVXK1Qnlh6cl6yev3CBe7FnuubOWfbukSIg7FI05yiWCsGmD3tZ03bYvsWsPLs46zFCP5i48TEfM7DwnxReo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734869136; c=relaxed/simple;
	bh=aNruRtG7ExtKqjONbi1Izo/oVVw8zfwdgUQQOkwjX5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RLqcUhfP6mJLfjKv5wdArXzlGpny9q24RvSOA1L874pZDGseRQLJx7AXuL1ReUyJNsPO4lk4SlpscgwIRlMZ8bhCXdATSncYb3zW9wls0G3vd1llxLeOa9HxslOKeqr/X+p+reErp3dlyK7u+6K8FkyYMyUlcmWERm7xIAEtgNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLW2o9n4; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLW2o9n4"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2163bd70069so30894575ad.0
        for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 04:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734869133; x=1735473933; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SDnS8QQfts8PNiRxxgrPusASUBk1U9XVmydpKZ+IB84=;
        b=OLW2o9n4LYPOTplKOZq75fJIBV6VrOYI1GyHsHCRSYm9KWzmP26g0RYVDu94RmYfQt
         D20r9ItdByOkbapAQYPaZQjQq1a0yJG8WEzbijPrlyPDKiZTg0JxGqfF04VRfdDtLjCs
         C2II6M7gp19NW/EfOBa/y7l8S1Q1gLVYVzW18gv4UbIOrWud88CqxhTKLIPgTI3bLnsp
         Q4nJD4ZBeYCZkazWNyfu5c+x7C5vCuMtneXpNmhhzykHbh6MJXi4Tl+OluQgqKY4FbeF
         1ZbN7AMoTL80vAcQCXivtSY3l/nhb8sC5So30JXWIA27i93ydVVgp8/T8BElyNsq1xEI
         HD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734869133; x=1735473933;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SDnS8QQfts8PNiRxxgrPusASUBk1U9XVmydpKZ+IB84=;
        b=oqSY+/2JMPxoBQyGXEiwnq95T5lxBWChzr27E8veCyAgDVjHKKvh1xSrLoNtVGrf2q
         MdKUSY9Uj+TR+j72K+E3/R5kJNM/IveBO1/AVUXdisaOT6+rJdmnGnhXZRsNcLcytk82
         XswqQc9TMpsX0d9RiN6KCCh8Pf2A9LuN/ySbB5P01GMeLHHzDxL6PyofcyZCm+tVz++l
         FOh+L+PXJz3ADhnPi1rrfD9wiEZFRYcU29Bmq0wslf8htoCTIuC5rZyL95zeTUSg9qNL
         GR+kJHwcKBOWFgAnFcxxU8j0A+reTnyW1C308orAtJCsu5/sv/W64hucumUiQ2l2y5+W
         iRPg==
X-Forwarded-Encrypted: i=1; AJvYcCVgu/Q2zYPfrRsgtMAaR7v88RJUGyqgbobA5PF7KYiZXRo3RavFjoxGBLaVjW3WgnsuH3y7lw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/HEJ2jGXJ1GCXErnLpNSXG8wn/Kntxkp60/PBJb6hb2d6FR2z
	yY0E4HBj/mDboEd2xnbmVqlCpNrIzhxMTcV+1RVL/js+zEU2O/Ud
X-Gm-Gg: ASbGncvEO8meWJvGmrzrGg48e1ibJKRubZEVog5mpWhJ+h7w9SpHnCpFFfKx3ajRLlb
	NHmfgL8mmsjuceYvLB3GdIv2HxLriyvCEeP9m9fw3KWrKwV5PEHrizN/rriwsebsy20RcIEMoPl
	aFfoy/XzBQYsYYwN1vMK7DKm5LNNYiDyveDQ3lrxLGSjY7eeRAI4lLM96wUr7x+DmF5eophqqwI
	H/Bz6Dnn6h+C6fTiwg97KpakAiKq2ZPk/ZPIDXoEU4bQ8BB/TNyYj1KVOw0E2Mj
X-Google-Smtp-Source: AGHT+IEOZVxAStgALtxwinLC8Odtu5ORiNvC9dCI78Mv1+c6vIuwDTv9FbdrmlFh0HXJYmlMCFWMnw==
X-Received: by 2002:a17:902:d4c4:b0:211:ce91:63ea with SMTP id d9443c01a7336-219e6ea1accmr99240495ad.15.1734869133310;
        Sun, 22 Dec 2024 04:05:33 -0800 (PST)
Received: from [192.168.0.109] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9716b3sm56358175ad.90.2024.12.22.04.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Dec 2024 04:05:32 -0800 (PST)
Message-ID: <bf93c563-f331-43c0-a145-1abf143bd0eb@gmail.com>
Date: Sun, 22 Dec 2024 20:05:28 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm64/mm: Drop configurable 48-bit physical
 address space limit
Content-Language: en-MW
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Kees Cook <keescook@chromium.org>, Quentin Perret <qperret@google.com>,
 asahi@lists.linux.dev
References: <20241212081841.2168124-8-ardb+git@google.com>
 <20241212081841.2168124-14-ardb+git@google.com>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241212081841.2168124-14-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ard,

On 12/12/2024 16:18, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Currently, the maximum supported physical address space can be
> configured as either 48 bits or 52 bits. The only remaining difference
> between these in practice is that the former omits the masking and
> shifting required to construct TTBR and PTE values, which carry bits #48
> and higher disjoint from the rest of the physical address.
> 
> The overhead of performing these additional calculations is negligible,
> and so there is little reason to retain support for two different
> configurations, and we can simply support whatever the hardware
> supports.

I am seeing a boot failure on Apple iPad 7 which uses 
CONFIG_ARM64_16K=y after this change in linux-next as commit
32d053d6f5e9, with nothing appearing on serial console with
earlycon enabled unless I set CONFIG_ARM64_VA_BITS_52=y. Reverting
this patch makes the kernel work again.

Nick Chan

