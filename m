Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DF61ABEAB
	for <asahi@lists.linux.dev>; Thu, 15 Aug 2024 15:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723735227; cv=none; b=RwlXDQJkhNNekIMHYHYn2IRP8p4iAbzvSNARk7cwlpXalvc8xr0WpDs3gWlDoXt+CcWugTie5R+9unAA4ggUhdMBOfcYFKFIim/hOGKWIsjaCaNNJqe8c1zDdDuS4OnZbWGgrNisCN4WxYLC9CTfQRGy0cYpxuSsiRx3swlEVFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723735227; c=relaxed/simple;
	bh=kynn0aDXaFm7QAh66HtBgvf/rrrNs3iw+NMTFkx0KDY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QWzNx6AdjeMGsHbj7Z793EHDNKlByi6gMttxQlqmz1cwvqMktI8/lm4o+WhEhQPstoFIyQ7J7oNNEf5kCoQUmEcE+mt6rBODIy2e79EKaxGYkHMavR82YPQbBgzHSWwiyIiJGBoj52NUbQwAedcSiHigFfy8VUogcfeBnt0Eim0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ilcMAFxE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ilcMAFxE"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-428178fc07eso6786625e9.3
        for <asahi@lists.linux.dev>; Thu, 15 Aug 2024 08:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723735224; x=1724340024; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=77DObEs8JyX6qlVaOpYeNL1lsgUGU/YYzxon+g94vZI=;
        b=ilcMAFxEmObCgTYGagXeuHKBH96kAF87C9xNaa3hFJZiuA4oRqHJ2K/AK8jyMqcovb
         ZMdCcZ8B+6GMghZW47U8ocbQD5CiLq/wpkVH0/L6nPteJqyMrBlrkw5N4nwi6XZRtogC
         ZclpCstTVvdKoOAUe7c2OYzvoWyZxsBahRf5u53IFUufBrzbL3zgt9xoUJe+0/Rt0Hna
         PNmitr6PFuf+rh8rnAQFhUarwREKb4rvOKb3HB/vWi9of851PO+dNITABq+jhQvhy12D
         /Q+iRfL5J60M76u8frev6/FM7jeUiENc6S5GJ2jijeped4yf0H6Q0eSdzaVQq1HIV8AJ
         AI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723735224; x=1724340024;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77DObEs8JyX6qlVaOpYeNL1lsgUGU/YYzxon+g94vZI=;
        b=cAgWBhDU6QwZJ/NcnVG/pvfvSWzexyeRk4IxH0KGoTj6t89Gma9lYcrfLWT+OFLQz+
         k6qOi2dccoqLH0P8aBV+Rs7M2+qYJPGMr/dYmoGpm5/fNqrp9zZ8IENJE0TAjOwEPrTe
         uqUu7WRt8oAor+l0PTvRXTSmETtKnDKat1NKKT9c5r+MnfjsJuPcFBxt7aEueGs3+8cr
         WJ8+JQa37p9xzCaQ93lH53+/i1/99nq8qftOUW0iEJ1WIESiO4tdc2Hz1hutHD7iLX5C
         Q317yV9Oa1+kJ5Cw5gE0uPMuyHbCryK18XyN5rRaiKI/h+o8C4rlg82xl4v/wJtUYfVa
         afMA==
X-Forwarded-Encrypted: i=1; AJvYcCW6nNbRT+4xkadwXqvX6W7yb7tsNhlPZ4UMjWLP3LS+C7dysD0LK9EAWsSAyETW42/ZKYhQZOMlOMqOZtaUYCqKpQNUQRA=
X-Gm-Message-State: AOJu0Yw8ikEeeTOTHEAOwcUsJ44g5Gj0RQivOLqCDRM0mJACr/eVx6QQ
	Q0im9Jm8cvCTTFVl3HkiB1bts4UC3XYtT7EH7niCBFwweZicDI2adnMIiqKVSUI=
X-Google-Smtp-Source: AGHT+IGqMleaD0yuCnI3sW+DxpEGDkIUT2PMFVSMNi6ePjupPJkLEGDnKEcO/CRoXc3Deb9XPcPDdg==
X-Received: by 2002:a05:600c:1990:b0:428:1d27:f3db with SMTP id 5b1f17b1804b1-429dd26c213mr40980305e9.35.1723735223450;
        Thu, 15 Aug 2024 08:20:23 -0700 (PDT)
Received: from [192.168.1.3] ([89.47.253.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718983a3a3sm1773010f8f.12.2024.08.15.08.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 08:20:22 -0700 (PDT)
Message-ID: <351904c9-d661-46bc-94cf-b6cea8371dad@linaro.org>
Date: Thu, 15 Aug 2024 16:20:22 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Perf (userspace) broken on big.LITTLE systems since
 v6.5
From: James Clark <james.clark@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
 Arnaldo Carvalho de Melo <acme@redhat.com>, Ian Rogers <irogers@google.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linux perf Profiling <linux-perf-users@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 James Clark <james.clark@arm.com>, "cc: Marc Zyngier" <maz@kernel.org>,
 Hector Martin <marcan@marcan.st>, Asahi Linux <asahi@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <08f1f185-e259-4014-9ca4-6411d5c1bc65@marcan.st>
 <ZV1AnNB2CSbAUFVg@archie.me>
 <a9c14dfd-3269-4758-9174-4710bef07088@leemhuis.info>
 <CAP-5=fXqx_k1miPTkcAmS3z2GBPt2KeDtP5fknmdDghZqxXPew@mail.gmail.com>
 <714ed350-0e6c-4922-bf65-36de48f62879@leemhuis.info>
 <0de3b572-f5f7-42e4-b410-d1e315943a3c@linaro.org> <ZrzeRM3ekLl9zp3z@x1>
 <348ea015-eccf-4f44-a332-a1d9d8baf81f@linaro.org>
Content-Language: en-US
In-Reply-To: <348ea015-eccf-4f44-a332-a1d9d8baf81f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 15/08/2024 4:15 pm, James Clark wrote:
> 
> 
> On 14/08/2024 5:41 pm, Arnaldo Carvalho de Melo wrote:
>> On Wed, Aug 14, 2024 at 05:28:42PM +0100, James Clark wrote:
>>>
>>>
>>> On 07/08/2024 9:54 am, Thorsten Leemhuis wrote:
>>>> On 01.08.24 21:05, Ian Rogers wrote:
>>>>> On Wed, Dec 6, 2023 at 4:09 AM Linux regression tracking #update
>>>>> (Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
>>>>>>
>>>>>> [TLDR: This mail in primarily relevant for Linux kernel regression
>>>>>> tracking. See link in footer if these mails annoy you.]
>>>>>>
>>>>>> On 22.11.23 00:43, Bagas Sanjaya wrote:
>>>>>>> On Tue, Nov 21, 2023 at 09:08:48PM +0900, Hector Martin wrote:
>>>>>>>> Perf broke on all Apple ARM64 systems (tested almost 
>>>>>>>> everything), and
>>>>>>>> according to maz also on Juno (so, probably all big.LITTLE) 
>>>>>>>> since v6.5.
>>>>>>
>>>>>> #regzbot fix: perf parse-events: Make legacy events lower priority 
>>>>>> than
>>>>>> sysfs/JSON
>>>>>> #regzbot ignore-activity
>>>>>
>>>>> Note, this is still broken.
>>>>
>>>> Hmmm, so all that became somewhat messy. Arnaldo, what's the way out of
>>>> this? Or is this a "we are screwed one way or another and someone 
>>>> has to
>>>> bite the bullet" situation?
>>>>
>>>> Ciao, Thorsten
>>>>
>>>>> The patch changed the priority in the case
>>>>> that you do something like:
>>>>>
>>>>> $ perf stat -e 'armv8_pmuv3_0/cycles/' benchmark
>>>>>
>>>>> but if you do:
>>>>>
>>>>> $ perf stat -e 'cycles' benchmark
>>>>>
>>>>> then the broken behavior will happen as legacy events have priority
>>>>> over sysfs/json events in that case. To fix this you need to revert:
>>>>> 4f1b067359ac Revert "perf parse-events: Prefer sysfs/JSON hardware
>>>>> events over legacy"
>>>>>
>>>>> This causes some testing issues resolved in this unmerged patch 
>>>>> series:
>>>>> https://lore.kernel.org/lkml/20240510053705.2462258-1-irogers@google.com/
>>>>>
>>>>> There is a bug as the arm_dsu PMU advertises an event called "cycles"
>>>>> and this PMU is present on Ampere systems. Reverting the commit above
>>>>> will cause an issue as the commit 7b100989b4f6 ("perf evlist: Remove
>>>>> __evlist__add_default") to fix ARM's BIG.little systems (opening a
>>>>> cycles event on all PMUs not just 1) will cause the arm_dsu event to
>>>>> be opened by perf record and fail as the event won't support sampling.
>>>>>
>>>>> The patch 
>>>>> https://lore.kernel.org/lkml/20240525152927.665498-1-irogers@google.com/
>>>>> fixes this by only opening the cycles event on core PMUs when choosing
>>>>> default events.
>>>>>
>>>>> Rather than take this patch the revert happened as Linus runs the
>>>>> command "perf record -e cycles:pp" (ie using a specified event and not
>>>>> defaults) and considers it a regression in the perf tool that on an
>>>>> Ampere system to need to do "perf record -e
>>>>> 'armv8_pmuv3_0/cycles/pp'". It was pointed out that not specifying -e
>>>>> will choose the cycles event correctly and with better precision the
>>>>> pp for systems that support it, but it was still considered a
>>>>> regression in the perf tool so the revert was made to happen. There is
>>>>> a lack of perf testing coverage for ARM, in particular as they choose
>>>>> to do everything in a different way to x86. The patch in question was
>>>>> in the linux-next tree for weeks without issues.
>>>>>
>>>>> ARM/Ampere could fix this by renaming the event from cycles to
>>>>> cpu_cycles, or by following Intel's convention that anything uncore
>>>>> uses the name clockticks rather than cycles. This could break people
>>>>> who rely on an event called arm_dsu/cycles/ but I imagine such people
>>>>> are rare. There has been no progress I'm aware of on renaming the
>>>>> event.
>>>>>
>>>>> Making perf not terminate on opening an event for perf record seems
>>>>> like the most likely workaround as that is at least something under
>>>>> the tool maintainers control. ARM have discussed doing this on the
>>>>> lists:
>>>>> https://lore.kernel.org/lkml/f30f676e-a1d7-4d6b-94c1-3bdbd1448887@arm.com/
>>>>> but since the revert in v6.10 no patches have appeared for the v6.11
>>>>> merge window. Feature work like coresight improvements and ARMv9 are
>>>>> being actively pursued by ARM, but feature work won't resolve this
>>>>> regression.
>>>>>
>>>
>>> I got some hardware with the DSU PMU so I'm going to have a go at 
>>> trying to
>>> send some fixes for this. My initial idea was to try incorporate the 
>>> "not
>>> terminate on opening" change as discussed in the link directly above. 
>>> And
>>> then do the revert of the "revert of prefer sysfs/json".
>>>
>>> FWIW I don't think Juno currently is broken if the kernel supports 
>>> extended
>>> type ID? I could have missed some output in this thread but it seems 
>>> like
>>> it's mostly related to Apple M hardware. I'm also a bit confused why the
>>> "supports extended type" check fails there, but maybe the v6.9 commit
>>> 25412c036 from Mark is missing?
>>>
>>> I sent a small fix the other day to make perf stat default arguments 
>>> work on
>>> Juno, and didn't notice anything out of the ordinary: 
>>> https://lore.kernel.org/linux-perf-users/dac6ad1d-5aca-48b4-9dcb-ff7e54ca43f6@linaro.org/T/#t
>>> I agree that change is quite narrow but it does incrementally improve 
>>> things
>>> for the time being. It's possible that it would become redundant if I 
>>> can
>>> just include Ian's change to use strings for Perf stat.
>>>
>>> Of course I only think I have a handle on the issue right now, seems 
>>> like it
>>> has a lot of moving parts and something else always comes up. If I hit a
>>> wall at some point I will come back here.
>>
>> Thanks for working on this, hopefully we'll get to a solution that keeps
>> all the expectations expressed in this thread about not breaking
>> existing muscle memory and that allows us to progress on this matter.
>>
>> - Arnaldo
> 
> Hi Arnaldo,
> 
> In one of your investigations here 
> https://lore.kernel.org/lkml/Zld3dlJHjFMFG02v@x1/ comparing "cycles", 
> "cpu-cycles" and "cpu_cycles" events on Arm you say only some of them 
> open events on both core types. I wasn't able to reproduce that on 
> perf-tools-next (27ac597c0e) or v6.9 (a38297e3fb) for perf record or 
> stat. I guessed the 6.9 tag because you only mentioned it was on tip and 
> it was 29th May. For me they all open exactly the same two legacy events 
> with the extended type ID set.

Minor correction, one opens using the PMU type rather a legacy event 
with extended type ID. But importantly they do all open on both CPU types.

