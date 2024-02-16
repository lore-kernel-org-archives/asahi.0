Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAD9137C58
	for <asahi@lists.linux.dev>; Fri, 16 Feb 2024 19:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708112921; cv=none; b=h9DP0vt3v7dy3qnYwGolU4hRVWWL6x3HjWEmHEcFMB/9C9XwGek7ehMlaNKZOc/+svDWOou1MtzHXWdnlwwGgNFpQT9K6kV3fWsXBUCsj+cFTYmrP2wvVL4GetCe3EmOXpD/QuzUxvdmscEtN0Yb8OLy7XXCEQCuIPo1r4gGSFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708112921; c=relaxed/simple;
	bh=m2Wvv0O31LwrnCQdUKYEs3sNTTEexlxilQS/jlCfnew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nVtbJCMX7loztu8DlJaZvsMDSNoSOgNAEkjnFyt5BoEI71Q/mqHeHab6vfHcbA9jkXiVGvKLqmVkTsHv1vOMi7Mgyg8NqmWhyjrgnbe0yTUsJ6xh6JktMFbJq53TvmJ4N8IrfXJ6Ipmx+KGPtbnX264fLVOlhvkwRaDRIBvR63Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=ckY10ujL; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="ckY10ujL"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-511ac701428so2947099e87.2
        for <asahi@lists.linux.dev>; Fri, 16 Feb 2024 11:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1708112917; x=1708717717; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMO1uzBf5Ipo+B8nJFhezHnHhPZI6cIYH4qqZglP7mw=;
        b=ckY10ujLnpt/e0yWo3qIWMdjzWkbxoNDzY5eS2aeUOuDwMDrqFCLfgMqmq4hAPslhe
         iAWbegax3LVPgJsnzcL3oCsWGTkJkYJSdtv9XD+aX1uSK051f8hWlUeu3+Tx4L5jcMII
         AgbH5rlwuXLEoTej6bzqyBfZRxQ4BFQMulEPYRgM+TUybu1KykNs8uA/Cjn2FCy/D6If
         5lVYFHPnB+gFJrkLofug8O6IwJALrq0yGGiZFZcLRUnM+DcDBqBeEw9Wsy6+h54WX4HA
         6scEMFXHtmr42qmp74LK+vCk8g6wdoxXJFdl8vba2FbqvTdvAF1CUW3m+Tk4yUvdSxn/
         K+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708112917; x=1708717717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMO1uzBf5Ipo+B8nJFhezHnHhPZI6cIYH4qqZglP7mw=;
        b=jlGWka4h4Kx6ZMHIsDSY78itVfPI2HiFfaHx6C50U3cp8jKKW7MljsFhGBPrlHV12L
         0Q4ALcdcblUtWaVJTXY+lQHtDevGsCOAghd4VqEydwOXkiL8KwZbdyo/MuxXWx3m/LE5
         Xbct+7rEg33em6OyFBvOy5EqJ9v8Rum66gZqwYiqlK4NawuL+D9I2xWxbgKztVB0GOy+
         aHPAQO56Lf9pEr3MW3VbSexxa6XwecfwWamSq3pI5nGyzAKJxyOvuqASFtSaNnRhPrB6
         1EdHVMOFOOKlaywIAL3T1wW4dLza9N7O0g+b+sucqzkMRO79InK2W0wJvdSJFTroCkV2
         SrKg==
X-Forwarded-Encrypted: i=1; AJvYcCU3VxwURWPaBUnK70Lump1XmhVO27rp5FlmVKDmXK88Yq5dzNOMVL+ViDrDihC+rPNUHYxWeggw10RYA+R+7WugJH6Nw3s=
X-Gm-Message-State: AOJu0YwcXIhGyqWRZsRqMXcL2NJA+h5BuRIKH8pt15HQmHWFL56Exukw
	4NFCE53QwG2cASITz0r4eBogEsT84ICgKJ4jNejYUgeRTZDByKeI5zX97z8NpZopKd1u8aGkvQg
	EK5OJlBayONpp/MWFlGePYhf7xEi4UK/BrLo5Uw==
X-Google-Smtp-Source: AGHT+IEiJLDM3GyyGWObGaRCyMN7MxvgX2HQgceLg5ERcIU76EjTibg8tg0F0e6PZPfErw11n01+i2wIipIreSPlOTo=
X-Received: by 2002:ac2:5bd1:0:b0:511:a021:220a with SMTP id
 u17-20020ac25bd1000000b00511a021220amr4183994lfn.21.1708112917508; Fri, 16
 Feb 2024 11:48:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231226200205.562565-1-pasha.tatashin@soleen.com>
 <20231226200205.562565-11-pasha.tatashin@soleen.com> <20240213131210.GA28926@willie-the-truck>
 <CA+CK2bB4Z+z8tocO79AdsAy+gmN_4aVHgFUsm_gYLUJ2zV1A6A@mail.gmail.com> <20240216175752.GB2374@willie-the-truck>
In-Reply-To: <20240216175752.GB2374@willie-the-truck>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 16 Feb 2024 14:48:00 -0500
Message-ID: <CA+CK2bDURTkZFo9uE9Bgfrz-NwgXqo4SAzLOW6Jb35M+eqUEaA@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] iommu: account IOMMU allocated memory
To: Will Deacon <will@kernel.org>
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
	yu-cheng.yu@intel.com, rientjes@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 12:58=E2=80=AFPM Will Deacon <will@kernel.org> wrot=
e:
>
> On Tue, Feb 13, 2024 at 10:44:53AM -0500, Pasha Tatashin wrote:
> > > >  SecPageTables
> > > > -              Memory consumed by secondary page tables, this curre=
ntly
> > > > -              currently includes KVM mmu allocations on x86 and ar=
m64.
> > > > +              Memory consumed by secondary page tables, this curre=
ntly includes
> > > > +              KVM mmu and IOMMU allocations on x86 and arm64.
> >
> > Hi Will,
> >
> > > While I can see the value in this for IOMMU mappings managed by VFIO,
> > > doesn't this end up conflating that with the normal case of DMA domai=
ns?
> > > For systems that e.g. rely on an IOMMU for functional host DMA, it se=
ems
> > > wrong to subject that to accounting constraints.
> >
> > The accounting constraints are only applicable when GFP_KERNEL_ACCOUNT
> > is passed to the iommu mapping functions. We do that from the vfio,
> > iommufd, and vhost. Without this flag, the memory useage is reported
> > in /proc/meminfo as part of  SecPageTables field, but not constrained
> > in cgroup.
>
> Thanks, Pasha, that explanation makes sense. I still find it bizarre to
> include IOMMU allocations from the DMA API in SecPageTables though, and
> I worry that it will confuse people who are using that metric as a way
> to get a feeling for how much memory is being used by KVM's secondary
> page-tables. As an extreme example, having a non-zero SecPageTables count
> without KVM even compiled in is pretty bizarre.

I agree; I also prefer a new field in /proc/meminfo named
'IOMMUPageTables'. This is what I proposed at LPC, but I was asked to
reuse the existing 'SecPageTables' field instead. The rationale was
that 'secondary' implies not only KVM page tables, but any other
non-regular page tables.

I would appreciate the opinion of IOMMU maintainers on this: is it
preferable to bundle the information with 'SecPageTables' or maintain
a separate field?

Pasha
