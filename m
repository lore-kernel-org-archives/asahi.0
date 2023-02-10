Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FD4A4D
	for <asahi@lists.linux.dev>; Fri, 10 Feb 2023 12:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676032707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PI3oUcKvFRhOHs5XVCh/GOynsoU/7+zmMQO9bHrhWBo=;
	b=jTqrUxsZYo0F7Z0uLgO52KguceVyH6AVI9Icq1OtDwdLd1VKH7KgpNAzALXYP1e7mKzoBy
	okXW8Vv4nRpVYG/gPxpcmpD9ZN5qZTog0lZ+ZPMrLFBe6xy1P9O+4Rl14LIO8B9Dw0irGP
	vW5FBbSdpTIoWjDoaaxDe0Vv3vCSazk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-290-QOxsoVHFPCeMVeeokYAbdA-1; Fri, 10 Feb 2023 07:38:25 -0500
X-MC-Unique: QOxsoVHFPCeMVeeokYAbdA-1
Received: by mail-wm1-f72.google.com with SMTP id l21-20020a05600c4f1500b003e00be23a70so4530075wmq.2
        for <asahi@lists.linux.dev>; Fri, 10 Feb 2023 04:38:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PI3oUcKvFRhOHs5XVCh/GOynsoU/7+zmMQO9bHrhWBo=;
        b=Zf9WAXfog3Rnd6+SQv/anrYSgh5pdhdLgPI3v6NsiLz0lkUxQEXkCcMeoxwc2QHpl1
         l7h5M4RSLTFZOlPhUCqNo21FqepR1CSRxX0KLkfM62vSx/eGTUTIZlUg6jMnc8nJHruT
         ZcsUtDKdc1trDRKBvOLYcITm5HHBqDF2ZvhNXSIj5jT3qt10Hoy2topjT1zwk1eLkHy+
         2/7XZdpPyXI2cFjpGd3meRFaCvJoDB2cK64Oi5SpEut5ccLYP4l2XCNokJO8dDnhzTvJ
         6k4fnZFl6z6N7VOQvRRPku8HRZ/ApdX4lvRYyi2RiE8OjJhEJ9KKwkKP1WzJr5vFjrhf
         WVdQ==
X-Gm-Message-State: AO0yUKXmTN19G2z14dWCIm/1TKFaMEwSAZ+klkGGLBskfvx7wTBcwSUy
	lZLTwRajSi4BcREEe+MiWmvjM+Eep1AbmM8l/uuoilsWyolJSEfVD7fKUCOSH9cjfW5vZUd1zfQ
	WsULpfNWMcIG/Pcs=
X-Received: by 2002:a5d:6750:0:b0:2be:64bb:1d84 with SMTP id l16-20020a5d6750000000b002be64bb1d84mr13710721wrw.24.1676032704781;
        Fri, 10 Feb 2023 04:38:24 -0800 (PST)
X-Google-Smtp-Source: AK7set94Bsqs5Ph/JyHM/6nNXatqCHays9ZS2lteG/fGGCwXWMilMicUznlG3v++jadE4RijV3uDbQ==
X-Received: by 2002:a5d:6750:0:b0:2be:64bb:1d84 with SMTP id l16-20020a5d6750000000b002be64bb1d84mr13710711wrw.24.1676032704636;
        Fri, 10 Feb 2023 04:38:24 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id s10-20020adff80a000000b002c54c7b9c78sm612414wrp.76.2023.02.10.04.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 04:38:24 -0800 (PST)
Message-ID: <bee5d455-3e15-427a-d7a6-f633a748f4c3@redhat.com>
Date: Fri, 10 Feb 2023 13:38:22 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/shmem-helper: Fix locking for
 drm_gem_shmem_get_pages_sgt()
From: Javier Martinez Canillas <javierm@redhat.com>
To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
References: <20230205125124.2260-1-lina@asahilina.net>
 <a1cd8c74-98f4-bff0-0344-cbece787c6e8@redhat.com>
In-Reply-To: <a1cd8c74-98f4-bff0-0344-cbece787c6e8@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/6/23 19:47, Javier Martinez Canillas wrote:
> Hello Lina,
> 
> On 2/5/23 13:51, Asahi Lina wrote:
>> Other functions touching shmem->sgt take the pages lock, so do that here
>> too. drm_gem_shmem_get_pages() & co take the same lock, so move to the
>> _locked() variants to avoid recursive locking.
>>
>> Discovered while auditing locking to write the Rust abstractions.
>>
>> Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
>> Fixes: 4fa3d66f132b ("drm/shmem: Do dma_unmap_sg before purging pages")
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> ---
> 
> Good catch. The patch looks good to me.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 

Pushed this to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

