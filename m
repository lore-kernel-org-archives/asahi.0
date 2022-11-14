Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93205187C
	for <asahi@lists.linux.dev>; Mon, 14 Nov 2022 06:57:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 4F2783FB17;
	Mon, 14 Nov 2022 06:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1668409039; bh=Tw+7lcrXFk+drYWSstDm3lS9y1kJn/SBLWzx96PMB+A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=m3E4L3Izm1X2hCXrAlJqqTWjvCEk439mdMFReCBb2sbk44J4QXi17/jD+kUpZYMqN
	 0QZD6ZAO39+ScLyYOcz6S1AN0aiMZuFyao2LPlXS3WnOta2X4qGw6ceztjOTX2k6m4
	 mfWbdABPWbFIirvVRLGoH0oL2xNVnBOtKxvgq+bTylTIOhELY+j9ofWAk3Lp7jlnsY
	 c6twRAGlgc9RI616Cjerae33QDIqAoWpPQPVbHLf994pYkPHxudngFpOJlLXnnqEqF
	 VVPad/D8mGcDOdqntbgFEdFbT2/A35R+QmUELRcq0eGG5qJY1Baebr/aN2vKdLJqYm
	 29ljkRBLXDw4Q==
Message-ID: <367270ad-114a-96ca-a92a-a7f54a5f3318@marcan.st>
Date: Mon, 14 Nov 2022 15:57:12 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 4/5] cpufreq: apple-soc: Add new driver to control
 Apple SoC CPU P-states
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Mark Kettenis <mark.kettenis@xs4all.nl>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221024043925.25379-1-marcan@marcan.st>
 <20221024043925.25379-5-marcan@marcan.st>
 <20221102061819.dyl5ah6qffntqieh@vireshk-i7>
 <c3b88bae-f6da-4242-0b19-5e2a32b9c266@marcan.st>
 <20221114065116.zs67pkbhhgfoze52@vireshk-i7>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20221114065116.zs67pkbhhgfoze52@vireshk-i7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/11/2022 15.51, Viresh Kumar wrote:
> On 09-11-22, 21:36, Hector Martin wrote:
>> On 02/11/2022 15.18, Viresh Kumar wrote:
>>>> +	ret = dev_pm_opp_set_sharing_cpus(cpu_dev, policy->cpus);
>>>
>>> Why do you need this ? The OPP core should be able to find this
>>> information by itself in your case AFAIU. The OPP core will refer
>>> "operating-points-v2 = <&pcluster_opp>" and find that the cores are
>>> related.
>>
>> We have multiple clusters sharing an OPP table (e.g. the M1 Ultra has 2
>> e-cluster and 4 p-clusters, and duplicating OPP tables seems very
>> silly), so this is necessary to tell it about the subset of cores
>> sharing a table that are actually one domain.
> 
> The cluster sharing information is already part of the OPP tables, "opp-shared"
> property. Platforms like scpi needed this because they didn't have the OPP table
> in DT and so no way to find out the relation of the CPUs.
> 
> See how drivers/cpufreq/mediatek-cpufreq.c has done this.
> dev_pm_opp_of_get_sharing_cpus() followed by dev_pm_opp_of_cpumask_add_table().

I don't think you understood me. We have multiple identical clusters.
All those clusters share an OPP table but are *not* the same cpufreq
domain. So we can have 8 CPUs which are two 4-CPU cluster using one OPP
table.

There is no way to express this relationship with OPP tables without
duplicating the tables themselves.

- Hector
