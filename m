Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E94397E6A
	for <asahi@lists.linux.dev>; Tue,  5 May 2026 03:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777953581; cv=none; b=WKfFjhNvMdLjKY2+zMfwAb43bSQ+BYPn2036SoraanN4iynpK92pRSKjuJMl/qpU/QSLmP7luA4RZ7FBvOFWalINlgCxGUllJp35yyjkF3kGqKukUYFMfW3RygOiTRkX5jaLZl3WQ5JzOuwnMJDMn7ZH5akWctG25YDPcvvDcLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777953581; c=relaxed/simple;
	bh=a+YUDaVvYwmqejKggDNsG92A1d16l1vbsSGStD94968=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKKGmgXNVr/nKERNVwbjrEwJdbC/SB/VAmSTIyjJGBiMsOxTNhAoU7vbupgTiOpfWcXs08X99PgFOqD34g64NAI3zlHeTQyfa4dzcKcYeHV2x8cF5PGbnU3U6FO2m3CKsAwQBZx01kaJnjWDtbslgR7skADVTcW+p2KcW1z0lNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n5H5p/gV; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n5H5p/gV"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso945750b3a.0
        for <asahi@lists.linux.dev>; Mon, 04 May 2026 20:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777953580; x=1778558380; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UDkBs+2XbGaX1zTF0vQnJxBMgO6n5hP8tSgf7oIzT00=;
        b=n5H5p/gVhSRETViOu8O83hZ3wzYAZjyGQa7q483unl08/ULGMPLyZSdwTj0bn85LL/
         zRABg7/VZQcagcu6iv461VD5JkK0cpTAG8VHZmDwRQtnm/7qFuSpLfgJDnhOVUBEbC89
         73bmTqkS4hxdaQyemnTh5fSRWu4cvXvJhkjBO5lMafY4anBhF7aixhOZ+lyLeHDyFFHb
         bc5lr9OMQqM8e2ijESDkeDZTGLFd++ld9PjcJ0QVJshYNQwT0tgaedVz/DpOlAXJhyaA
         2/geoe/sGphcRoHrs7Wb4+jzXs1maHRAGYQUhqEiw2sv3RbqgrLYrutL1sAmPVL3jYlj
         79tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777953580; x=1778558380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDkBs+2XbGaX1zTF0vQnJxBMgO6n5hP8tSgf7oIzT00=;
        b=ZuRE6DCPAmqxFRR1U1v/AAdRmDIw7cR571VyhsvD7qFMfrDfA3mPOsLWLMvrKtS3Mp
         QNesL4IqEkQOys4IuFa4c6Ao4pSuvtDrDcUxmOXlFxNDUpZqV1kVTnrXcKliZ9JAsKtu
         2b62U8PYOIqcOpIrRZTVmK2K3aLudHgSX+izwmHUPGdxwThdhRtvaDUQYovracVPAgyY
         42Z0FJRiatzim02QjN9v1SPkESdhiVBjsPbwxujxKOaDgRzxMG0QlTIoBec/m4Uo/+Dv
         RGxVzfZV+cjWsjs9yRwlJd/W5G/kY7X5dwZM+xuDbHvdTCmlr/DZsuUiZLVL1n4VmxQu
         Ft/A==
X-Forwarded-Encrypted: i=1; AFNElJ9HurOfHJM4cdrj55iRCWiQDBIALmDJ1XoSvVI8KXhgzEt0yN8KnrWFbO8BYNnpMr8tV9B0vw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx54sU23bm0BkzofgxJBxTLDyrH4u73an4bE0Q/T6Ee45I3JKLS
	8c3DPjLI/N/rCThVs3kT+PRLV0VSutL2IZUz5GFUyp9OMHbuSA8PKABUpoK9FBa8AaE=
X-Gm-Gg: AeBDiesCEspJpyiMKzuPM2Yqf2+FCP4Mt5KpMBo0EsdlIyu4Q8DC51wE3UC88aAhdM5
	yVSXFQqdAcrWFWQ07eX0yBBOKzDPSJfQKcLOMPkLAw7fXTpjEXUgYtVkgk23Uir8aerhKRU/l06
	kJbBYXHHHyOZTsiOWHWydnJKNkSMNXOlFgtVWVArSDYLmiGmKV7BVTJsZYwq6CMiwPeL1PXSmL8
	FAdTstsXHGtemnETI0hdypL/biu7CJe/pSnC0gP40s3PATke1+N9SN2ZoviiTXJa9VnWb3euWYr
	tE4wrMWXlt0tPrQkOnzLGOmN0a01Zzx9NHfyMVHXGRL9zTK9H4IdBGVPY78FahNoLnhtDQkZO+F
	xWGToXjd/yqzldiR1ugLwzALGvf66yr6DEuI+dE6IF5vVKn71SEN0vw4Zt2uaY7ApNrqBTIp7Cy
	el8oEExchGx4bQfbWtmRSuROrh/aZgrmU6TA==
X-Received: by 2002:a05:6a00:2346:b0:82c:9c90:6ea0 with SMTP id d2e1a72fcca58-838fc20cda8mr1565125b3a.3.1777953579622;
        Mon, 04 May 2026 20:59:39 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbee14sm573002b3a.48.2026.05.04.20.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 20:59:38 -0700 (PDT)
Date: Tue, 5 May 2026 09:29:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: ray.huang@amd.com, mario.limonciello@amd.com, rafael@kernel.org, 
	sven@kernel.org, j@jannau.net, perry.yuan@amd.com, kprateek.nayak@amd.com, 
	neal@gompa.dev, linux-pm@vger.kernel.org, asahi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] *cpufreq: Use FIELD_MODIFY() for bitfield operations
Message-ID: <xguly4zwdl4bloaq4wbb445vl7otmjlnitzr2xhvfosncnjgvi@e2sbpnk6e2ff>
References: <20260430163213.44695-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430163213.44695-1-18255117159@163.com>

On 01-05-26, 00:32, Hans Zhang wrote:
> Replace open-coded bitfield modifications with the standard FIELD_MODIFY()
> macro. This improves code readability and safety without functional
> changes.
> 
> FIELD_MODIFY() internally performs the same mask-clear + set operation but
> adds type checking and compile-time field boundary verification.
> 
> Hans Zhang (2):
>   cpufreq/amd-pstate: Use FIELD_MODIFY()
>   cpufreq: apple-soc: Use FIELD_MODIFY()
> 
>  drivers/cpufreq/amd-pstate.c        | 26 ++++++++++----------------
>  drivers/cpufreq/apple-soc-cpufreq.c |  6 ++----
>  2 files changed, 12 insertions(+), 20 deletions(-)

Applied. Thanks.

-- 
viresh
