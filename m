Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BB42C18C
	for <asahi@lists.linux.dev>; Thu,  4 Jan 2024 19:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="lAKV8Mp9"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6dc1fdc19b6so521009a34.0
        for <asahi@lists.linux.dev>; Thu, 04 Jan 2024 11:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1704395583; x=1705000383; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+vYEuDAPJ/iEdESxX2pInRN4g9EPXyQ5h9FSdd/4u4=;
        b=lAKV8Mp9pwi1JiBiwgTP4JPSrG5LXGEVxeEzNRcsala9Ss9K0tFZSFeja3ccbK/9Tj
         mjl7Y1ohk8ByeA6jZ2fYDcyW9P2yxyAGHcUmGbBaZ+Zj0WrlJrZx9Q5AfFXrO9U39z/r
         sruejraI2Yk8y1kRwVSgTb18j9uos9ULnV3l6L+VqJ9D3rgrSZLHNOOVbUjXs7Vm0GDP
         zDcugmvK2IxesXUgBChY6gEWudceiYiW+/mwS4YGLIuYaFqc1duoVjZrDXImvkp03/Xg
         i9xQlCw5tsZdyjNM0by7jHBmNS7zunO/CxJ7ps4funLcM3rzUCmNxVQUaL3+8mVtPPoJ
         ajmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704395583; x=1705000383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+vYEuDAPJ/iEdESxX2pInRN4g9EPXyQ5h9FSdd/4u4=;
        b=E8sYcQKswYSkL52Q6FXEUffTYx6rgvGyIZ2815JP0y/bqjOYg4xFPRHmniX0k0pKQy
         wWw0BGOiRXmtFjvxo0TqLtJYX8+iZVD47CZqyOjZxb5o7z/im0cieI3M29pSWr1b0uSN
         NKAPEE9re1xc1eDur/MGBx2iHud+ygy5+SHm6/DkbyRtDXz4/eAFVmdjVJXGeuZAiLMp
         dEbFx5mO8uRSoqg9qJqODbo/vkeTha/LXho0g+HpE1s+qz19qQqYGPXD8BZvFWVmph1b
         OhAbCNd6v/BXRh3aye+jl+e/UZPrNjsYySRedCNmHFPeFmjOICCekc6R4DT1qqZKHSHi
         Wqgw==
X-Gm-Message-State: AOJu0Yyk9lVrvXzhypj8x9+tNP80h7KrXDJG/DhQZVCgkuofCCZEA+n3
	yx6fSMR9HIfmSxr5SgVSsK7vI/CfP3KAvAqaUdZ8StmGipCnFg==
X-Google-Smtp-Source: AGHT+IF/5x1qWEeEN53jwIdamLjEry3P/nE1f12xa2taaKft/YlEJdrBP6aDzExJ1bDcrqKpemuFKkiIEAFmrNQGE5k=
X-Received: by 2002:a05:6358:8828:b0:174:b7f2:51db with SMTP id
 hv40-20020a056358882800b00174b7f251dbmr1188037rwb.19.1704395582852; Thu, 04
 Jan 2024 11:13:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231226200205.562565-1-pasha.tatashin@soleen.com>
 <eqkpplwwyeqqd356ka3g6isaoboe62zrii77krsb7zwzmvdusr@5i3lzfhpt2xe>
 <CA+CK2bBE1bQuqZy3cbWiv8V3vJ8YNJZRayp6Wv-j2_9i37XT4g@mail.gmail.com> <eng4vwaci5hwlicszgcld6uny55vll2bfs3vp2yjbjf3exhamg@zf6yc2uhax7w>
In-Reply-To: <eng4vwaci5hwlicszgcld6uny55vll2bfs3vp2yjbjf3exhamg@zf6yc2uhax7w>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 4 Jan 2024 14:12:26 -0500
Message-ID: <CA+CK2bCUGepLLA2Hsmq00XEhPzLWPb5CjzY_UPT0qWSKastjAQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] IOMMU memory observability
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: akpm@linux-foundation.org, alim.akhtar@samsung.com, alyssa@rosenzweig.io, 
	asahi@lists.linux.dev, baolu.lu@linux.intel.com, bhelgaas@google.com, 
	cgroups@vger.kernel.org, corbet@lwn.net, david@redhat.com, 
	dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
	iommu@lists.linux.dev, jernej.skrabec@gmail.com, jonathanh@nvidia.com, 
	joro@8bytes.org, krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
	mhiramat@kernel.org, m.szyprowski@samsung.com, paulmck@kernel.org, 
	rdunlap@infradead.org, robin.murphy@arm.com, samuel@sholland.org, 
	suravee.suthikulpanit@amd.com, sven@svenpeter.dev, thierry.reding@gmail.com, 
	tj@kernel.org, tomas.mudrunka@gmail.com, vdumpa@nvidia.com, wens@csie.org, 
	will@kernel.org, yu-cheng.yu@intel.com, rientjes@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 12:04=E2=80=AFPM Michal Koutn=C3=BD <mkoutny@suse.co=
m> wrote:
>
> On Thu, Jan 04, 2024 at 11:29:43AM -0500, Pasha Tatashin <pasha.tatashin@=
soleen.com> wrote:
> > Thank you for taking a look at this. The two patches [1] [2] which add
> > GFP_KERNEL_ACCOUNT were sent separate from this series at request of
> > reviewers:
>
> Ah, I didn't catch that.
>
> Though, I mean the patch 02/10 calls iommu_alloc_pages() with GFP_KERNEL
> (and not a passed gfp from iommu_map).
> Then patch 09/10 accounts all iommu_alloc_pages() under NR_IOMMU_PAGES.
>
> I think there is a difference between what's shown NR_IOMMU_PAGES and
> what will have __GFP_ACCOUNT because of that.
>
> I.e. is it the intention that this difference is not subject to
> limiting?

Yes, we will have a difference between GFP_ACCOUNT and what
NR_IOMMU_PAGES shows. GFP_ACCOUNT is set only where it makes sense to
charge to user processes, i.e. IOMMU Page Tables, but there more IOMMU
shared data that should not really be charged to a specific process.
The charged and uncharged data will be visible via /proc/vmstat
nr_iommu_pages field.

Pasha

>
> (Note: I'm not familiar with iommu code and moreover I'm only looking at
> the two patch sets, not the complete code applied. So you may correct my
> reasoning.)
>
>
> Thanks,
> Michal
