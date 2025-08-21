Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E151049659
	for <asahi@lists.linux.dev>; Thu, 21 Aug 2025 15:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755788539; cv=none; b=pQI0diTqswDxbsDtVvQIFvhH/CDEj0Py8UVTqh6RG9nuyyXjSAwhDSQdYLXqA1rXjtymqr0ODRZwIBWbe7yOA07P+2isMd3G/sqvNwA9sadbKJB9K+3mTkq3ucs15TOJdW4x+UvomGOdcZJspMuNWP8iek7vcz4JAeR+coYaA0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755788539; c=relaxed/simple;
	bh=vC3CLgnF8Pd6UZr4opBua66AiWCZArbSVC6s099569k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNaa5baPp8ygqZ9PlcE9dFuHnaw5ySAELud7FKEvd1XTm7K/r3erHR3ErBFTivzUBU+MU8/jPI9ux9sa7p8ZFzOLl4QeSF/jjH82Uw5djMhDOK5uCqnNlMlYjIBaqJHAXa1oqXeyO8rhVyG5NxEYljTeI10vial92vWQotRQjjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6539152B;
	Thu, 21 Aug 2025 08:02:07 -0700 (PDT)
Received: from [10.1.36.29] (e122027.cambridge.arm.com [10.1.36.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1591A3F59E;
	Thu, 21 Aug 2025 08:02:10 -0700 (PDT)
Message-ID: <9445754d-28d2-4c95-a2f8-b850032b99d1@arm.com>
Date: Thu, 21 Aug 2025 16:02:09 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/panthor: Add support for atomic page table
 updates
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Caterina Shablia <caterina.shablia@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, asahi@lists.linux.dev,
 Asahi Lina <lina@asahilina.net>
References: <20250707170442.1437009-1-caterina.shablia@collabora.com>
 <d4a6208b-a4a4-451f-9799-7b9f5fb20c37@arm.com> <2813151.QOukoFCf94@xps>
 <2434159.cojqenx9y0@xps> <0108b3cd-dfdd-4e4c-a2d8-157458e26f77@arm.com>
 <20250821135127.2827abfb@fedora>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250821135127.2827abfb@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/08/2025 12:51, Boris Brezillon wrote:
> On Wed, 16 Jul 2025 16:43:24 +0100
> Steven Price <steven.price@arm.com> wrote:
[...]
>> Although in general I'm a bit wary of relying on the whole lock region
>> feature - previous GPUs have an errata. But maybe I'm being over
>> cautious there.
> 
> We're heavily relying on it already to allow updates of the VM while
> the GPU is executing stuff. If that's problematic on v10+, I'd rather
> know early :D.

I think I'm just scarred by my experiences over a decade ago... ;)

I'm not aware of any issues with the modern[1] GPUs. The issue used to
be that the lock region could get accidentally unlocked by a cache flush
from another source - specifically the cache flush on job start flag.

It's also not a major issue if you keep the page tables consistent, the
lock region in theory allows a region to be in an inconsistent state -
but generally there's no need for that. AFAIK we mostly keep the tables
consistent anyway.

Thanks,
Steve

[1] Which in this context means well over a decade - it's somewhat scary
how long I've been doing this!

> Regards,
> 
> Boris

