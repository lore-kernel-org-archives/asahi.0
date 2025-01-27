Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE50347CC
	for <asahi@lists.linux.dev>; Mon, 27 Jan 2025 03:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737948762; cv=none; b=V2yQzWwuhi5jjxctHbuu3kQJOCxOe6SOyAF/z95+o3wJc5jjvv7NjPzmvMvwOUrO+6NvbTY9hilqCZOjlIR0Qnhy+1+r4gufVS+YK+NdeQWVHSbI1R68EH155WhmazYAfEBQ2qPJlvOdOPCUTMy4y3jkmZXhAUOS6aIZXZYzZn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737948762; c=relaxed/simple;
	bh=YiJT9WQLqKtxa/sdK0/rOM1AOUebCQeiyhpJpoFR/Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joAiM2xQI89VlCoIdkHdSPwiB1E56EhwaQd7Uuy8vGrrse6/7JhZcr24XOZ4H1lOkJVcn/t1sKSjly7YhxUZndJ4bOiWsHHogkrqaZufJqXa1G5EwBkmMYtEmhUJA3VMxz+wUTsCQsVlMiP3VNcePjsDgl3nTkRCOQNHYPF1cpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vjLRcybh; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vjLRcybh"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21636268e43so85269405ad.2
        for <asahi@lists.linux.dev>; Sun, 26 Jan 2025 19:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737948759; x=1738553559; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HSKBdkcHUpmfLPk161Kn0rx+ur3BhotIfl5VOt/amok=;
        b=vjLRcybheqG1gwhGHdiTHFBE2aeqyak881iHYwFwac3GNs8z3wNAHSm02GyamkJ0om
         QjWnMboTk8F/0anTAIqP4zAmRmEtLB/CN1NiVhyb+vNHOO7Mr0wAudXTE3I04/2ez0Cf
         3nwchHTVHcb/A2fqQ4BfzzL9BAAVc76Q5unK5+KVFYeiXU6dromPtbjwGbXnNL9J3LmA
         RYWoII4disrKte/bjvg8p0tCYp+hV3YTsU/+BvgzilPkNtbT1lSo9BNidMt8hTm7BQLx
         8aBjgl7XbeLi8daS+Fdt5tdj5DIBxb7ws5CHJ5KloDpYmqNip4T7GGDfdbjBnLReH6Bz
         vxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737948759; x=1738553559;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSKBdkcHUpmfLPk161Kn0rx+ur3BhotIfl5VOt/amok=;
        b=QJn40WoYvGE46bWi8tgqKS443x57S4cbfd52geGaqmQ6eOFdWXtDuJT4dmgin8fjvD
         HVZD2pSnVlnpJSHXbEowQbua2On8C1aenYNjQDmaSxj1IFQ9MegvXF1ggaMKuFs/LYjU
         4UiNUEHYD3XGsOJpVCfdXRFxoCj595L7Qp/634H0tAY/ojXclHA4BAc9do9AVYt3CpNC
         4/8ZSrkpzEW9noe8uYKqU1GAjdSRQ0TJ8pEvbq8w4RIc6d4h2mWTcwVYi5DozIw/Nd5v
         3mYNNB2bwKo3B99ij0yfESa3loQAOlo+SB5xLPVPMZ8kGOaMM15F5I/HNUO4TI2q0LMY
         NBng==
X-Forwarded-Encrypted: i=1; AJvYcCUKsE4uAmNsWF87aZas1JG8ZiBMoeGabVbb8YhRsvSfyXWQVApsI8okneA/4LjJVO8vMCHBEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcJKGTcGfY6jawKjKizqeX1ZLAj0mtuKLRRzcFmXp9hGGYplXG
	5Ez3uJrFuiQxaKYK+z+Nw8R+jVjVnszSE92qkBo/uHqOAowPX/z5TpVooM2/xx8=
X-Gm-Gg: ASbGnctCfz9UqZQAkOv3j6ixduB2yMeYn+3CZM33NM02o9D720t93SBcNxsepH34tIi
	8vhqO5bL8bF+dLKSzZULtcA9oe5E0WSMn+tgXHPzdiGoLHaimMRvwOXPXob8aLvx+6yWq4FmB/m
	53v+SABxAc6dS24SrDeD1sfZfk+6EBXKTF6E4iiwdKP0eZ2XLxGafSK2KylLzqbXvaEvQlRnrHH
	7FEKYcWg1jgpgjd6/mdHarNp3GlUrwybZTqDQn+Z4SLcC75a6vEbXnpfCYdKgU/209fR+TCjzyw
	GooMWv0=
X-Google-Smtp-Source: AGHT+IHvgBNK3NhwKI9n5fMBriq7FLdQFhDFQyHQaZNGZxzhpW+eaG60WMmG2z8DBaIbsP1G1cn9Zg==
X-Received: by 2002:a05:6a20:728d:b0:1db:eead:c588 with SMTP id adf61e73a8af0-1eb215ec4b9mr65731325637.29.1737948759394;
        Sun, 26 Jan 2025 19:32:39 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac496bbd01esm5342591a12.71.2025.01.26.19.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 19:32:38 -0800 (PST)
Date: Mon, 27 Jan 2025 09:02:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Hector Martin <marcan@marcan.st>,
	Huacai Chen <chenhuacai@kernel.org>, Huang Rui <ray.huang@amd.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sven Peter <sven@svenpeter.dev>, WANG Xuerui <kernel@xen0n.name>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>, arm-scmi@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 00/15] cpufreq: simplify boost handling
Message-ID: <20250127033228.abeqhrxoprqw5b4e@vireshk-i7>
References: <cover.1737707712.git.viresh.kumar@linaro.org>
 <CAJZ5v0jYSZQKkLN-TO_h0AazhHZtHgpavTnnAscLPYLmjX3LaA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0jYSZQKkLN-TO_h0AazhHZtHgpavTnnAscLPYLmjX3LaA@mail.gmail.com>

On 24-01-25, 12:05, Rafael J. Wysocki wrote:
> On Fri, Jan 24, 2025 at 9:58 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Hello,
> >
> > The boost feature can be controlled at two levels currently, driver
> > level (applies to all policies) and per-policy.
> >
> > Currently most of the drivers enables driver level boost support from the
> > per-policy ->init() callback, which isn't really efficient as that gets called
> > for each policy and then there is online/offline path too where this gets done
> > unnecessarily.
> >
> > Also it is possible to have a scenario where not all cpufreq policies support
> > boost frequencies. And letting sysfs (or other parts of the kernel) enable boost
> > feature for that policy isn't correct.
> >
> > Simplify and cleanup handling of boost to solve these issues.
> 
> I guess this depends on the previous series?

Yes my series and the boost related patches in your tree.

-- 
viresh
