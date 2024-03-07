Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC196F50D
	for <asahi@lists.linux.dev>; Thu,  7 Mar 2024 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709800762; cv=none; b=adgxH2USVtUFfy4fXejHDA39MeMYZk3/USg/VvFTBxIv5GHz69p2Rh4EV6ArD3QN21L1tNAa2lMSeV9kn/Yu70CN2i+/b0EZJE1f9lQ2QHwJXo66NYGsR+pQ4UPHuuu7y/VjFJpdUeBiAeEo+ySnSQh0ZF+m2v/Rag/3oZcS6Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709800762; c=relaxed/simple;
	bh=NuF+qPJABFgOg7vA4V2O7cmy7VCmpDEn/7jbFfX/J2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qiLW5lzJLg41fAoFkl3LaorKyNMuKr140GVZ0v9wWvr1wyNppr/wED64qfen+cjBO9Nx+Z8q3ck8oHXCiIwl6Dlst/Gw3nuvNiCLN28CuOqmhgPixxMZKLFlpvai2FeiZFNGr5vjxg4pJ3GuYvwzBtpq58o+Je5lwLxwBvWLra4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51334491779so199279e87.0
        for <asahi@lists.linux.dev>; Thu, 07 Mar 2024 00:39:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709800759; x=1710405559;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NuF+qPJABFgOg7vA4V2O7cmy7VCmpDEn/7jbFfX/J2Y=;
        b=Xbd4nfWVCD8ohU8qdVzWlBDe1usmJItyHff25l0j1jkDTKs68/sggpKSYrjMLeeWOV
         80Zqp10w/tVXBLMOS/uARP5G+yNm9nsbnU7wbYfOhV87c+KBsu7N+6DF0CqxhPxS/rAM
         BP18hWqXOKAMwNt4p+BiGkSBYrYJzpU5180TPgHHnRjC9e8c8kLkX049eyz/mmrQSggO
         HfEuoBRLXrMvxbXaT5SebzwOTJdzcILNY2k+L3yN6W8yCYAQWhU/5taIkKraG8yodDNL
         dPDvHM+4toI17ytRMqF/YYHAaZowNoAdnzs45/lFaAVohjE0oRbfgITbDwjw13b5qXrW
         HB5w==
X-Forwarded-Encrypted: i=1; AJvYcCVUDulBD+S9cmOz/RZBAi0PSGNQVstflMX7moeC0lYIGLOTRYGc918fKqvtdAW/F35VvypvsrbYHXV0lJzMzPuWoAEFh84=
X-Gm-Message-State: AOJu0YwKn4M3U53LsJGOFs5VU7yiOPFmOI8VniYlIZ3+Sjef4wM9Ec8u
	4Ajpayk2kLyh9raEFfP+AMw6ZfI9tfY1sY9NN+qiXL+KWVlXJTzP
X-Google-Smtp-Source: AGHT+IEl+WlZVJiVq8IZf5wSRagWHVG0u/tE7mCQhtsneylApmt2R47hLVqxcBZNSr8Aph9hLCoG5A==
X-Received: by 2002:a05:651c:104b:b0:2d2:4532:e6e9 with SMTP id x11-20020a05651c104b00b002d24532e6e9mr709243ljm.3.1709800759017;
        Thu, 07 Mar 2024 00:39:19 -0800 (PST)
Received: from [10.100.102.74] (46-117-80-176.bb.netvision.net.il. [46.117.80.176])
        by smtp.gmail.com with ESMTPSA id fm11-20020a05600c0c0b00b00412de55135dsm1912930wmb.41.2024.03.07.00.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 00:39:18 -0800 (PST)
Message-ID: <ab89b6a6-7015-430c-90de-6709c342ed90@grimberg.me>
Date: Thu, 7 Mar 2024 10:39:16 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: convert nvme to atomic queue limits updates v2
Content-Language: en-US
To: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 James Smart <james.smart@broadcom.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 linux-nvme@lists.infradead.org
References: <20240304140500.78583-1-hch@lst.de>
 <ZeX2eSKE5OSAgbGh@kbusch-mbp.mynextlight.net>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <ZeX2eSKE5OSAgbGh@kbusch-mbp.mynextlight.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 04/03/2024 18:27, Keith Busch wrote:
> Thanks, applied to nvme-6.9.

FWIW,

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
