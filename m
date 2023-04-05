Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2312029A9
	for <asahi@lists.linux.dev>; Wed,  5 Apr 2023 14:55:13 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-930bc91df7bso116943966b.1
        for <asahi@lists.linux.dev>; Wed, 05 Apr 2023 07:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1680706511;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOaR+m1IdKafTORqEeSKI9ra6GC/lDyynNYDfbx3OGU=;
        b=VOcQEAwu5WIl2BXbkiz++NKRv+L2KBXjYnQVvHuoDd8AYVukZMZAp7Kh8e2RwoLTO6
         cOGPDQ+oJuNjOiImUXbZmozOYjQC5Pmo78cdP+qD8uAna23UHG4I4ZO0cW7zwr4ZeKau
         aHnRQL6kE7IfsbbjCxwiUTLPTY+vlPLfyqntA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680706511;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MOaR+m1IdKafTORqEeSKI9ra6GC/lDyynNYDfbx3OGU=;
        b=rVPD6cetIJg4bhjsvX+n1Is5whuO8JAow181EVekb/Vkrlc34pyeYleEs+wPT5+plL
         8PSJW+MZnlpe48wPASv5tXd7nv8lPgx9k9uvf8n6FsDumkejFOnc4wSTxMlHija9khjL
         ZBITAfEdYF+J2nLERJEfpCtrXOv8TIExkubC2T+7QI/R8+XObntrq1Py9of96ZAfvwCg
         9chmo0qzy3qaQuftLWyOruE5dA4swSTKMqMa2X0e7/zrpGuELuhEtg8sT+ZHL+AhNiDq
         Sy/IQBOYLQMmXQJTSOtrxHsHYg7CvxrOPrASFe/H7urIRco3atq+2HAonhtUGy2vBJBa
         N14g==
X-Gm-Message-State: AAQBX9eQ5495UzD/sLpAN2mgE/IwELsMPSE+l9QGJxCcgUP6I3+x+x8j
	dCpamVKutG58x+LRFZkmPgS4Pg==
X-Google-Smtp-Source: AKy350bSVmKQEeeS1X8+Q1+6RPrW42vDuHh4vOBA13B/ImZaryj0w4jta/xaGwUENLHN7VRkn928jQ==
X-Received: by 2002:a17:906:5195:b0:92c:fc0:b229 with SMTP id y21-20020a170906519500b0092c0fc0b229mr2784171ejk.0.1680706511286;
        Wed, 05 Apr 2023 07:55:11 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id ty25-20020a170907c71900b00948ca65d61fsm3581129ejc.140.2023.04.05.07.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 07:55:10 -0700 (PDT)
Date: Wed, 5 Apr 2023 16:55:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Asahi Lina <lina@asahilina.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Luben Tuikov <luben.tuikov@amd.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Karol Herbst <kherbst@redhat.com>,
	Ella Stanforth <ella@iglunix.org>,
	Faith Ekstrand <faith.ekstrand@collabora.com>,
	Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-sgx@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH RFC 13/18] drm/gem: Add a flag to control whether objects
 can be exported
Message-ID: <ZC2LzME5uHT3JDht@phenom.ffwll.local>
Mail-Followup-To: Asahi Lina <lina@asahilina.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Luben Tuikov <luben.tuikov@amd.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Karol Herbst <kherbst@redhat.com>,
	Ella Stanforth <ella@iglunix.org>,
	Faith Ekstrand <faith.ekstrand@collabora.com>,
	Mary <mary@mary.zone>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-sgx@vger.kernel.org, asahi@lists.linux.dev
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-13-917ff5bc80a8@asahilina.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307-rust-drm-v1-13-917ff5bc80a8@asahilina.net>
X-Operating-System: Linux phenom 6.1.0-7-amd64 

On Tue, Mar 07, 2023 at 11:25:38PM +0900, Asahi Lina wrote:
> Drivers may want to support driver-private objects, which cannot be
> shared. This allows them to share a single lock and enables other
> optimizations.
> 
> Add an `exportable` field to drm_gem_object, which blocks PRIME export
> if set to false. It is initialized to true in
> drm_gem_private_object_init.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Two comments on this:

- for kernel objects which userspace never access itself the usual
  approach is to simply not install a gem handle on that drm_file. If
  userspace doesn't even have a handle they also can't export it. I think
  that should take care of the kernel object case you have in the asahi
  driver.

- for the vm-private object case you need some more checks anyway, since
  you can't even use such objects on a different vm within the same
  drm_file. Maybe the gpuva helpers can eventually cover this, but in
  general these driver cases are handled by simply overwriting the
  ->export case, you can check there for vm_id.is_none() and if that's not
  the case, hand the actual exporting to the helper function.

  Whether this is done in the rust wrappers and you keep the
  set_exportable or just in asahi code is kinda meh, but personally for
  consistency I'd put that into asahi code. Imo it's much clearer when you
  explicitly list (by coding them into your export impl) the reasons why a
  buffer isn't exportable, instead of forcing people to chase
  set_exportable calls throughout the codebase. But also a bit matters of
  taste :-)

Either way (unless a missed a case) this should imo be handled in asahi
code and not in C or the rust glue.
-Daniel

> ---
>  drivers/gpu/drm/drm_gem.c   | 1 +
>  drivers/gpu/drm/drm_prime.c | 5 +++++
>  include/drm/drm_gem.h       | 8 ++++++++
>  3 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 7a3cb08dc942..152ad9295a8d 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -166,6 +166,7 @@ void drm_gem_private_object_init(struct drm_device *dev,
>  
>  	drm_vma_node_reset(&obj->vma_node);
>  	INIT_LIST_HEAD(&obj->lru_node);
> +	obj->exportable = true;
>  }
>  EXPORT_SYMBOL(drm_gem_private_object_init);
>  
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index f924b8b4ab6b..9d2dd982580e 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -391,6 +391,11 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
>  		return dmabuf;
>  	}
>  
> +	if (!obj->exportable) {
> +		dmabuf = ERR_PTR(-EINVAL);
> +		return dmabuf;
> +	}
> +
>  	if (obj->funcs && obj->funcs->export)
>  		dmabuf = obj->funcs->export(obj, flags);
>  	else
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 772a4adf5287..852dec3cf763 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -361,6 +361,14 @@ struct drm_gem_object {
>  	 * The current LRU list that the GEM object is on.
>  	 */
>  	struct drm_gem_lru *lru;
> +
> +	/**
> +	 * @exportable:
> +	 *
> +	 * Whether this GEM object can be exported via the drm_gem_object_funcs->export
> +	 * callback. Defaults to true.
> +	 */
> +	bool exportable;
>  };
>  
>  /**
> 
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
