Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4F67E2
	for <asahi@lists.linux.dev>; Thu,  1 Sep 2022 00:22:36 +0000 (UTC)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
	id 22D3326EF4A; Thu,  1 Sep 2022 02:22:34 +0200 (CEST)
Date: Thu, 1 Sep 2022 02:22:34 +0200
From: Janne Grunau <j@jannau.net>
To: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux-foundation.org,
	Konrad Dybcio <konrad.dybcio@somainline.org>, asahi@lists.linux.dev,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Georgi Djakov <quic_c_gdjako@quicinc.com>,
	Hector Martin <marcan@marcan.st>,
	"Isaac J. Manjarres" <isaacm@codeaurora.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] iommu/io-pgtable-dart: Add DART PTE support for
 t6000
Message-ID: <20220901002234.GD10102@jannau.net>
References: <20220621071848.14834-1-j@jannau.net>
 <20220621071848.14834-5-j@jannau.net>
 <2df8c1d1-fb83-5b92-d32a-6b8ba988844c@arm.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2df8c1d1-fb83-5b92-d32a-6b8ba988844c@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On 2022-06-27 16:13:20 +0100, Robin Murphy wrote:
> On 2022-06-21 08:18, Janne Grunau wrote:
> > From: Sven Peter <sven@svenpeter.dev>
> > 
> > The DARTs present in the M1 Pro/Max/Ultra SoC use a diffent PTE format.
> > They support a 42bit physical address space by shifting the paddr and
> > extending its mask inside the PTE.
> > They also come with mandatory sub-page protection now which we just
> > configure to always allow access to the entire page. This feature is
> > already present but optional on the previous DARTs which allows to
> > unconditionally configure it.
> > 
> > Signed-off-by: Sven Peter <sven@svenpeter.dev>
> > Co-developed-by: Janne Grunau <j@jannau.net>
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > 
> > ---
> > 
> > Changes in v3:
> > - apply change to io-pgtable-dart.c
> > - handle pte <> paddr conversion based on the pte format instead of
> >    the output address size
> > 
> > Changes in v2:
> > - add APPLE_DART2 PTE format
> > 
> >   drivers/iommu/io-pgtable-dart.c | 51 +++++++++++++++++++++++++++------
> >   drivers/iommu/io-pgtable.c      |  1 +
> >   include/linux/io-pgtable.h      |  1 +
> >   3 files changed, 45 insertions(+), 8 deletions(-)
> > 
> [...]
> > @@ -536,7 +571,7 @@ apple_dart_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
> >   	if (!cfg->coherent_walk)
> >   		return NULL;
> > -	if (cfg->oas > 36)
> > +	if (cfg->oas != 36 && cfg->oas != 42)
> >   		return NULL;
> 
> Wouldn't it make sense to tie this to the format? Maybe 36-bit OAS is still
> valid with v2, but presumably 42-bit with v1 definitely isn't.

The format is not know inside the alloc call unless I add per format 
alloc wrapper. I think we can trust the caller for now.

Janne

