Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208D22F2F
	for <asahi@lists.linux.dev>; Mon,  6 Feb 2023 18:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675709239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hZ8casbfFD6TcKT9nSSfpPqsT0aAOl1x1pNCxblmoQc=;
	b=F2r/SNZ0WaU9tfNhyQh77MPdG4ayWp4u5oykYxXKOKboXG3jLzGcd4hXbPlflpClr0inKv
	PG87wn7+Sm5Ub+mjPhoEWi4JC7RKQEj2FkCMxn6eLFIm6sUizcUsF9DSF/OZvXWT/tArUi
	AnR1u9M9SZtKeX1mP+MmiLFPa4YeCcY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-501-FigvTKOhORysMzJXeyZHCw-1; Mon, 06 Feb 2023 13:47:16 -0500
X-MC-Unique: FigvTKOhORysMzJXeyZHCw-1
Received: by mail-wr1-f72.google.com with SMTP id b9-20020adfc749000000b002c3dede475cso766093wrh.6
        for <asahi@lists.linux.dev>; Mon, 06 Feb 2023 10:47:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZ8casbfFD6TcKT9nSSfpPqsT0aAOl1x1pNCxblmoQc=;
        b=7MHtz20P1ZZL37N3QFC1bXpZ9Y0zA0HqIODutIAti/xKR8zG+v0fXc22q1uVvD/7Il
         5cCXQWtwIC9Zupa7XBVDXzprMWLB0EOq3lkJKZTtbkKjGKHbLtj2VI4Y44huueJiP5Qn
         JfQYubTT4IQb3TLGXGAVRlMAon5i6xd+eP19OMXsTF210EB+o5GHSJQoukpxBiicpf7g
         q76a5GPYZ944TYj8hxfllNZNYoYycxA3V6KyiPzcaoLAjRnWvnRbpDz3XpnbI/YAIhcF
         arCFurvTFft+TFikXQW1GbHoa3zpRZlyUL0SLadvq2Qgfe6zLcuLeR1DHjL3md56sKd1
         toEA==
X-Gm-Message-State: AO0yUKXSCodHZ734oET3Gop5vR4pvarkeqxkJrwvvW5IU46wVMgtnjK4
	agDCqnKhhvVwx3XCMqmgq+OwJR5lCXiFULyJN+nAE2Wck/QXkg0Fw0AXHSwbky0vedcqbKBe4b/
	gYClM8cptoGmR0OU=
X-Received: by 2002:a05:600c:18a6:b0:3dd:1a8b:7374 with SMTP id x38-20020a05600c18a600b003dd1a8b7374mr702585wmp.5.1675709235680;
        Mon, 06 Feb 2023 10:47:15 -0800 (PST)
X-Google-Smtp-Source: AK7set9O+AFBlSx1vEYGijuQNmYcM6SnLQcrjncn2maMR7AxUw5thKkNysCaeGtaTLYwLHkwW2zybw==
X-Received: by 2002:a05:600c:18a6:b0:3dd:1a8b:7374 with SMTP id x38-20020a05600c18a600b003dd1a8b7374mr702568wmp.5.1675709235494;
        Mon, 06 Feb 2023 10:47:15 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c7-20020a05600c0ac700b003d1d5a83b2esm16444126wmr.35.2023.02.06.10.47.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 10:47:15 -0800 (PST)
Message-ID: <a1cd8c74-98f4-bff0-0344-cbece787c6e8@redhat.com>
Date: Mon, 6 Feb 2023 19:47:13 +0100
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
To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
References: <20230205125124.2260-1-lina@asahilina.net>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230205125124.2260-1-lina@asahilina.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Lina,

On 2/5/23 13:51, Asahi Lina wrote:
> Other functions touching shmem->sgt take the pages lock, so do that here
> too. drm_gem_shmem_get_pages() & co take the same lock, so move to the
> _locked() variants to avoid recursive locking.
> 
> Discovered while auditing locking to write the Rust abstractions.
> 
> Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
> Fixes: 4fa3d66f132b ("drm/shmem: Do dma_unmap_sg before purging pages")
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---

Good catch. The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

What about drm_gem_shmem_free() BTW, I believe that the helper should also
grab the lock before unmap / free the sgtable?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

