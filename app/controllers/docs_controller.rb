class DocsController < ApplicationController
    before_action :set_doc, only: [:edit, :update, :show, :destroy]

    def index
        @docs = current_user.docs.order(created_at: :desc)
    end

    def new
        @doc = current_user.docs.build
    end

    def create
        @doc = current_user.docs.build(doc_params)

        if @doc.save
            redirect_to @doc
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @doc.update(doc_params)
            redirect_to @doc
        else
            render 'edit'
        end
    end

    def destroy
        @doc.destroy
        redirect_to docs_path
    end

    private
        def set_doc
            @doc = Doc.find(params[:id])
        end

        def doc_params
            params.require(:doc).permit(:title, :content)
        end
end
